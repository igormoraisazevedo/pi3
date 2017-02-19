#!/bin/bash

# Variaveis
HORARIO=$(date +"%d/%m/%Y %H:%M")
LOG="/vagrant/config_repo.log"

# Checando a existencia do arquivo de LOG

if ! [ -f "$LOG" ]
then
	touch /vagrant/config_repo.log
fi

echo -e "\n######### $HORARIO - Configurando Repositorio  ############" >> $LOG

echo -e "\n########################################" >> $LOG
echo "####### Atualizando Repositorios #######" >> $LOG
echo -e "########################################\n" >> $LOG

sudo apt-get update >> $LOG 2>&1 
