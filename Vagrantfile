# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "tactical-vagrant"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # Tomcat port
  config.vm.network :forwarded_port, guest: 80, host: 3080, auto_correct: true

  # Only needs a name if we are running a singleton
  config.vm.provider :virtualbox do |vb|
    vb.name = "TACTIC"
  end

  # Setup TACTIC
  branch = ENV['BRANCH'] || "master"
  config.vm.provision "shell", path: "install-tactic.sh", args: branch
  config.vm.provider :virtualbox do |vb|
    # Give TACTIC 2G and 2CPUS
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

end
