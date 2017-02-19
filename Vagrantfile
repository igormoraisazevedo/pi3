# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	# VM do Ambiente de Homologacao
	config.vm.define "homologacao" do |homologacao|

		# Hostname da VM
		homologacao.vm.hostname = "homologacao.localdomain"
		
		# Imagem que será utilizada para configurar a VM
		homologacao.vm.box = "ubuntu/xenial64"
		
		# Configuracao da Rede e IP
		homologacao.vm.network "private_network", ip: "192.168.10.10"
		
		# Executa script para a configuracao do ambiente de homologacao
		homologacao.vm.provision :shell, :path => "init_homologacao.sh"	
	
		# Configuracoes passadas ao Provisionador, neste caso o VirtualBox
		homologacao.vm.provider "virtualbox" do |vbox|
		        
			# Qtd de CPUs
			vbox.customize [ "modifyvm", :id, "--cpus", "1" ]
		        
			# Qtd de Memoria RAM
			vbox.customize [ "modifyvm", :id, "--memory", "512" ]
		end

	end
end
