#!/bin/bash

# Variaveis
HORARIO=$(date +"%d/%m/%Y %H:%M")
LOG="/vagrant/init_$1.log"

# Checando a existencia do arquivo de LOG
if ! [ -f "$LOG" ]
then
	touch $LOG
fi

echo -e "\n######### VM $1 inicializada em: $HORARIO  ############" >> $LOG

# Atualizando repositorios
echo -e "\n########################################" >> $LOG
echo "####### Atualizando Repositorios #######" >> $LOG
echo -e "########################################\n" >> $LOG

sudo apt-get update >> $LOG 2>&1

# Aplicando atualizacoes da distribuicao
echo -e "\n######################################################" >> $LOG
echo "####### Aplicando Atualizacoes na Distribuicao #######" >> $LOG
echo -e "######################################################\n" >> $LOG

sudo apt-get dist-upgrade -y >> $LOG 2>&1

# Configurando data e hora - Fuso America/Maceio
echo -e "\n#########################################################" >> $LOG
echo "####### Configurando Data e Hora - America/Maceio #######" >> $LOG
echo -e "#########################################################\n" >> $LOG

sudo apt-get install ntpdate -y >> $LOG 2>&1
sudo ln -sf /usr/share/zoneinfo/America/Maceio /etc/localtime
sudo sed -i 's/NTPDATE_USE_NTP_CONF=yes/NTPDATE_USE_NTP_CONF=no/g' /etc/default/ntpdate
sudo sed -i 's/ntp.ubuntu.com/pool.ntp.br/g' /etc/default/ntpdate
sudo ntpdate pool.ntp.br >> $LOG 2>&1

# Editar arquivo hosts das VMs
echo -e "\n###############################################" >> $LOG
echo "####### Configurando arquivo /etc/hosts #######" >> $LOG
echo -e "###############################################\n" >> $LOG

sudo sed -i '/127.0.1.1/d' /etc/hosts
sudo sed -i '/localdomain/d' /etc/hosts
sudo echo  "192.168.10.10 manager.localdomain manager" >> /etc/hosts
sudo echo  "192.168.10.20 worker1.localdomain worker1" >> /etc/hosts 
sudo echo  "192.168.10.30 worker2.localdomain worker2" >> /etc/hosts

# Instalando os softwares do Ambiente
echo -e "\n#########################################" >> $LOG
echo "####### Instalando Git e Git-Hub  #######" >> $LOG
echo -e "#########################################\n" >> $LOG

sudo apt-get install -y \
	git-core \
	git-hub >> $LOG 2>&1

echo -e "\n############################################################" >> $LOG
echo "####### Instalando o Docker via Repositório Oficial  #######" >> $LOG
echo -e "############################################################\n" >> $LOG

# Instalando dependencias do Docker
sudo apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common >> $LOG 2>&1

# Configurar repositorio oficial do Docker
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add - >> $LOG 2>&1

# Adicionar reposiorio oficial no sources.list.d
sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main" >> $LOG 2>&1

# Atualizar repositorios
sudo apt-get update >> $LOG 2>&1

# Instalar Docker
sudo apt-get -y install docker-engine >> $LOG 2>&1

# Ativar servico do Docker
sudo systemctl enable docker >> $LOG 2>&1
sudo systemctl start docker >> $LOG 2>&1

echo -e "\n############################################" >> $LOG
echo "####### Instalando o Docker Compose  #######" >> $LOG
echo -e "############################################\n" >> $LOG

# Download da versao mais recente do Docker Compose (2017-03-04, versão 1.11.2)
sudo curl -sL https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

# Configurar permissao do execucao para o Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Instalando o Bash Completion do Docker Compose
sudo curl -sL https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# Limpeza do cache dos pacotes
sudo apt-get autoclean -y
