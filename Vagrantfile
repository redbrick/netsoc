# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here.
  
  # Disable the default vagrant share
  config.vm.synced_folder ".", "/vagrant", :disabled => true

  # Configure a management server.
  config.vm.define "mgmt" do |server|
    server.vm.box = "precise64"

    server.vm.hostname = "mgmt"
    server.vm.network :private_network, ip: "10.10.1.2"

    server.vm.provision "shell", path: "setup.sh"	
    server.vm.synced_folder "./deployment", "/srv/ansible/"
  end
  
  # Configure a DNS server.
  config.vm.define "dns" do |server|
    server.vm.box = "precise64"

    server.vm.hostname = "dns"
    server.vm.network :private_network, ip: "10.10.1.3"
  end
  
  # Configure a logging server.
  config.vm.define "logging" do |server|
    server.vm.box = "precise64"

    server.vm.hostname = "logging"
    server.vm.network :private_network, ip: "10.10.1.4"
  end
  
  # Configure a web server.
  config.vm.define "www" do |server|
    server.vm.box = "precise64"

    server.vm.hostname = "web"
    server.vm.network :private_network, ip: "10.10.1.10"
  end
  
  # Configure an IRC server.
  config.vm.define "www" do |server|
    server.vm.box = "precise64"

    server.vm.hostname = "web"
    server.vm.network :private_network, ip: "10.10.1.11"
  end

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  #
  config.vm.provider :virtualbox do |vb|
    # Boot with headless mode.
    vb.gui = false
  
    # Use VBoxManage to customize the VM.
    vb.customize ["modifyvm", :id, "--memory", "256"]
  end
end
