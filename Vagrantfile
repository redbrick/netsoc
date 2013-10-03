# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here.

  # Configure a management server.
  config.vm.define "mgmt" do |mgmt|
    mgmt.vm.box = "precise64"

    mgmt.vm.hostname = "mgmt"
    mgmt.vm.network :private_network, ip: "10.10.1.2"

    mgmt.vm.provision "shell", path: "setup.sh"	
    mgmt.vm.synced_folder "./deployment", "/srv/ansible/"
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
