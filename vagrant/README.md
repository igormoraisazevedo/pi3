Arquivos para a configuração do Vagrant, no intuito de subir duas VMs no VirtuaBox que simularão os ambientes de Homologação e Produção.

Softwares Necessários:
- VirtualBox 5 ou superior;
- Vagrant 1.9 ou superior.
 
Arquivos Necessários:
- VagrantFile - Arquito que automatiza o provisionamento das VMs;
- config_inicial.sh - Shell script que automatiza a instalação dos softwares necessários ao ambiente, bem como algumas configurações das VMs.

Procedimento de configuracao do ambiente:
 - Faça o download dos arquivos do repositório https://github.com/igormoraisazevedo/pi3/vagrant
 - Instale o Vagrant e o VirtualBox
 - Acesse o dieretório onde estão os arquivos do repositório
 - Execute o comando: vagrant up
 - Depois execute o comando: vagrant provision
