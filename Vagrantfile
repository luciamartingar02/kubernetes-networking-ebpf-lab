# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

  # Base box
  config.vm.box = "boxen/rockylinux-9"
  config.vm.box_version = "2025.08.20.12"
  
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # SSH 
  config.ssh.username = "vagrant"
  config.ssh.insert_key = false
  config.vm.boot_timeout = 300
  config.ssh.password = "vagrant"

  # Configuracion Hyper-V
  config.vm.provider "hyperv" do |h|
    h.enable_virtualization_extensions = true
  end
  
  # Hyper-V Switch Interno
  K8S_SWITCH = "k8s-switch"
  
  
  # RKE2 MASTER
  config.vm.define "master" do |m|
    m.vm.hostname = "rke2-master"


    m.vm.network "public_network",
      bridge: K8S_SWITCH
	  
    m.vm.provider "hyperv" do |h|
	  h.memory = 4096
	  h.cpus   = 2
    end
    
    # Asegurar SSH activo
    m.vm.provision "shell", 
	  path: "provision/configure-ssh.sh"
	
	m.vm.provision "shell",
	  path: "provision/configure-network.sh",
	  env: {
		"NODE_IP" => "192.168.100.10"
	  }
	
  end


  # RKE2 WORKER
  config.vm.define "worker" do |m|
    m.vm.hostname = "rke2-worker"

    m.vm.network "public_network",
      bridge: K8S_SWITCH

    m.vm.provider "hyperv" do |h|
	  h.memory = 4096
	  h.cpus   = 2
    end

    # Asegurar SSH activo
    m.vm.provision "shell", 
	  path: "provision/configure-ssh.sh"
	
	m.vm.provision "shell",
	  path: "provision/configure-network.sh",
	  env: {
		"NODE_IP" => "192.168.100.11"
	  }
	
  end


  # ANSIBLE CONTROL NODE
  config.vm.define "ansible" do |a|

    a.vm.hostname = "ansible"

    a.vm.network "public_network",
	  bridge: K8S_SWITCH

    a.vm.provider "hyperv" do |h|
	  h.memory = 2048
	  h.cpus   = 1
    end

    a.vm.provision "shell", 
	  path: "provision/configure-ssh.sh"
	
	a.vm.provision "shell",
	  path: "provision/configure-network.sh",
	  env: {
		"NODE_IP" => "192.168.100.5"
	  }
	  
  end 

end
