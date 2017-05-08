# Diretório Ansible
Arquivos para a gestão de configuração do Cluster Docker utilizando o Ansible.

Softwares Necessários:
 - Python 2.6 ou superior;
 - docker-py;
 - API Docker;
 - Ansible 2 ou superior;
 - Módulos do Ansible:
	- apt: *Módulo responsável pelo gerenciamento de pacotes em distribuições Debian like*
	- docker_container: *Módulo responsável pelo gerenciamento do ciclo de vida de um container Docker.*
	- docker_image: *Módulo responsável pelo gerenciamento de images Docker;*
 
Arquivos Necessários:
	- update_distro.yml: *Playbook do Ansible responsável por atualizar os pacotes da distribuição das VMs do cenário* .
	- create_image_webserver.yml: *Playbook do Ansible responsável por criar a imagem do container webserver a partir do seu DockerFile* .
	- run_webserver.yml: *Playbook do Ansible para criar o container Webserver a partir da imagem que foi criada* .
	- stop_webserver.yml: *Playbook do Ansible que para o container Webserver* .

Procedimento de configuracao do ambiente:
	- Faça o download dos arquivos do repositório https://github.com/igormoraisazevedo/pi3/tree/master/ansible .
	- Instale o Ansible utilizando os procedimentos do desenvolvedor: http://docs.ansible.com/ansible/intro_installation.html) .
	- Edite o arquivo /etc/ansible/hosts e adicione dois grupos de hosts:
		1) docker-managers: *Todos os IPs das VMs que possuem a função de Manager no Docker Swarm* .
		2) docker-workers: *Todos os IPs das VMs que possuem a função de Worker no Docker Swarm* .
	- Copie o Dockerfile do Webserver (docker/webserver/webserver-Dockerfile) para o diretório /vagrant da VM 'manager'.
