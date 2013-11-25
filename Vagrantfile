# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest
  config.vm.box = "base"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
  config.vm.network :forwarded_port, guest: 22, host: 2222
    
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "10.0.0.13"
  
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network :public_network
  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|

     # Don't boot with headless mode
     vb.gui = true
  
     # Use VBoxManage to customize the VM. For example to change memory:
     # vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  # Enable Berkshelf
  config.berkshelf.enabled=true

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.add_recipe "mysql"
  
    # You may also specify custom JSON attributes:
    chef.json = { :mysql_password => "foo" }
  end
end
