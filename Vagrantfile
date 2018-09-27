# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "dynatrace-bastion"
  #force locale
  ENV['LC_ALL']="en_US.UTF-8"
  
  config.vm.network "private_network", ip: "10.10.10.10"
  config.vm.network "public_network", ip: "10.0.2.15", bridge: [
    "en0: Wi-Fi (AirPort)",
    "en0: Wi-Fi (AirPort)"
  ]

  
  config.vm.provider "virtualbox" do |vb|
     vb.name = "dynatrace-bastion"
     vb.gui = false
  
     vb.memory = "2048"
     vb.cpus = 1
  end
  
  config.vm.provision "shell", path: "provision.sh", privileged: false
  #config.vm.provision "file", source: "provision.sh", destination: "provision.sh"
  
end