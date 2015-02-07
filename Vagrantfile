# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  
  # Disable the default vagrant share
  config.vm.synced_folder ".", "/vagrant", :disabled => true
  
  # Configure a management server.
  config.vm.define "mgmt" do |server|
    server.vm.hostname = "mgmt"
    server.vm.network :private_network, ip: "10.10.1.2"

    server.vm.provision "shell", path: "setup.sh"
    server.vm.synced_folder "./deployment", "/etc/ansible/", :mount_options => ["dmode=711","fmode=644"]
  end
  
  # Configure a DNS server.
  config.vm.define "dns" do |server|
    server.vm.box = "precise64"

    server.vm.hostname = "dns"
    server.vm.network :private_network, ip: "10.10.1.3"
  end
  
  # Configure an LDAP server.
  config.vm.define "ldap" do |server|
    server.vm.hostname = "ldap"
    server.vm.network :private_network, ip: "10.10.1.4"
  end
  
  # Configure a logging server.
  config.vm.define "logging" do |server|
    server.vm.hostname = "logging"
    server.vm.network :private_network, ip: "10.10.1.5"

    server.vm.provider :virtualbox do |vb|
      # Use VBoxManage to customize the VM.
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  
  # Configure a web server.
  config.vm.define "www" do |server|
    server.vm.hostname = "web"
    server.vm.network :private_network, ip: "10.10.1.10"
  end
  
  # Configure an IRC server.
  config.vm.define "irc" do |server|
    server.vm.hostname = "irc"
    server.vm.network :private_network, ip: "10.10.1.11"
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  #
  config.vm.provider :virtualbox do |vb|
    # Boot with headless mode.
    vb.gui = false
  
    # Use VBoxManage to customize the VM.
    vb.customize ["modifyvm", :id, "--memory", "256"]
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end
end
