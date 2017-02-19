#!/bin/bash

# Variaveis
HORARIO=$(date +"%d/%m/%Y %H:%M")
LOG="/vagrant/init_homologacao.log"

# Checando a existencia do arquivo de LOG

if ! [ -f "$LOG" ]
then
	touch /vagrant/init_homologacao.log
fi

echo -e "\n######### VM inicializada em: $HORARIO  ############" >> $LOG

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

# Instalando os softwares do Ambiente
echo -e "\n###############################" >> $LOG
echo "####### Instalando Git  #######" >> $LOG
echo -e "###############################\n" >> $LOG

sudo apt-get install -y \
	git \
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
