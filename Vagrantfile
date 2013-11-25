# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  [1,2].each do |node_num|
    node = "db#{node_num}".to_sym
      config.vm.provider :virtualbox do |vb|
      vb.gui = true
    end
  
    config.vm.define node do |node_config|
      node_config.vm.box = node.to_s
      node_config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
      node_config.vm.network "public_network"
      node_config.vm.network :private_network, ip: "10.0.0.#{10 + node_num}"
      node_config.omnibus.chef_version = :latest
      node_config.berkshelf.enabled=true
      node_config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "cookbooks"
        chef.add_recipe "locale-gen"
        chef.add_recipe "mysql::server"
        chef.roles_path = "roles"
        chef.add_role(node_num == 1 ? 'master' : 'slave')
        chef.json = { 
          localegen: {
            lang:['en_US','en_US.utf8']
          }, 
          :mysql => {
            :tunable => {
              :"server-id" => node_num,
            },
            :server_root_password => "",
            :server_repl_password => "repl_pw"
          }
        }
      end
    end
  end
end
