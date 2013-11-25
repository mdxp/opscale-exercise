# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.vm.box = "raring64"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
    
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end
  
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled=true
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.json = { :mysql_password => "this-is-not-the-most-secure-password-in-existence" }
    chef.add_recipe "mysql"
  end

  # Define VMs to use for this mysql cluster; If you want the master 
  # server to start by itself on a simple "vagrant up" uncomment the next 
  # line and comment out the first line of the current master define block.
  # config.vm.define "master", primary: do |master|
  config.vm.define "master" do |master|
    master.vm.name = "dbmaster"
    master.vm.network :private_network, ip: "10.0.0.13"
    master.vm.network :forwarded_port, guest: 22, host: 2222
  end
  
  config.vm.define "slave" do |slave|
    slave.vm.name = "dbslave"
    slave.vm.network :private_network, ip: "10.0.0.113"
    slave.vm.network :forwarded_port, guest: 22, host: 2322
  end
end
