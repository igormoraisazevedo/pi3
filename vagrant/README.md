# Diretório Vagrant
Arquivos para a configuração do Vagrant, no intuito de subir três  VMs no VirtuaBox que simularão um ambiente de Cluster com Docker.

Softwares Necessários:
- VirtualBox 5 ou superior;
- Vagrant 1.9 ou superior.
 
Arquivos Necessários:
- VagrantFile - Arquivo que automatiza o provisionamento das VMs;
- config_inicial.sh - Shell script que automatiza a instalação dos softwares necessários ao ambiente, bem como algumas configurações das VMs.

Procedimento de configuracao do ambiente:
 - Faça o download dos arquivos do repositório https://github.com/igormoraisazevedo/pi3/tree/master/vagrant
 - Instale o Vagrant e o VirtualBox
 - Acesse o diretório onde estão os arquivos do repositório
 - Execute o comando: *vagrant up*
 - Depois execute o comando: *vagrant provision*
 - Para acessar as VMs: *vagrant ssh nome_da_vm*

Executado o procedimento acima, será criado no VirtualBox três VMs:
 - Manager: 192.168.10.10
 - Worker1: 192.168.10.20
 - Worker2: 192.168.10.30
