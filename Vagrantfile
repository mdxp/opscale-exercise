# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.vm.box = "raring32"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
  config.vm.network "public_network"
  config.vm.define "master" do |master|
    master.vm.network :private_network, ip: "10.0.0.13"
  end
  
  config.vm.define "slave" do |slave|
    slave.vm.network :private_network, ip: "10.0.0.113"
  end

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end
  
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled=true
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "locale-gen"
    chef.add_recipe "mysql"
    chef.json = { 
      localegen: {lang:['en_us','en_US.itf8']}, 
      :mysql_password => "this-is-not-the-most-secure-password-in-existence" 
    }
  end
end
