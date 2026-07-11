# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "bento/rockylinux-9"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # SSH estable
  config.ssh.username = "vagrant"
  config.ssh.insert_key = false
  config.vm.boot_timeout = 300
  config.ssh.password = "vagrant"

  # Configuracion de la RAM y CPU de las VMs
  config.vm.provider "hyperv" do |h|
    h.memory = 4096 #4GB
    h.cpus = 2
    h.enable_virtualization_extensions = true
  end
  
  config.vm.define "master" do |m|
    m.vm.hostname = "rke2-master"


    m.vm.network "public_network",
      bridge: "k8s-switch"
    
    # Asegurar SSH activo
    m.vm.provision "shell", inline: <<-SHELL
      sudo systemctl enable sshd
      sudo systemctl restart sshd
    SHELL
	
	m.vm.provision "shell",
	  path: "provision/master-network.sh"
	
  end

  config.vm.define "worker" do |m|
    m.vm.hostname = "rke2-worker"

    m.vm.network "public_network",
      bridge: "k8s-switch"

    # Asegurar SSH activo
    m.vm.provision "shell", inline: <<-SHELL
      sudo systemctl enable sshd
      sudo systemctl restart sshd
    SHELL
	
	m.vm.provision "shell",
	  path: "provision/worker-network.sh"
	
  end
 
end
