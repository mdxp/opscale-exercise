# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  config.omnibus.chef_version = :latest

  # Every Vagrant virtual environment requires a box to build off of.

  config.vm.box = "base"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. 
  
  config.vm.network :forwarded_port, guest: 22, host: 2222
    
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"
  
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  
  config.vm.network :public_network
  
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  
  config.vm.synced_folder "../data", "/vagrant_data"
  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  
  config.vm.provider :virtualbox do |vb|
     # Don't boot with headless mode
     vb.gui = true
  
     # Use VBoxManage to customize the VM. For example to change memory:
     # vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "../my-recipes/cookbooks"
    chef.roles_path = "../my-recipes/roles"
    chef.data_bags_path = "../my-recipes/data_bags"
    chef.add_recipe "mysql"
    chef.add_role "web"
  
    # You may also specify custom JSON attributes:
    chef.json = { :mysql_password => "foo" }
  end
end
