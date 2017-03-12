#!/bin/bash

# Variaveis
HORARIO=$(date +"%d/%m/%Y %H:%M")
LOG="/vagrant/config_swarm.log"
PAPEL=$1
IP=$2

# Checando a existencia do arquivo de LOG
if ! [ -f "$LOG" ]
then
        touch $LOG
fi

echo -e "\n##################################################" >> $LOG
echo "####### Configurando um $PAPEL do Cluster  #######" >> $LOG
echo -e "##################################################\n" >> $LOG

case $PAPEL in
	"firstmanager")
		sudo docker swarm init --advertise-addr $IP >> $LOG 2>&1
		sudo docker swarm join-token -q worker > /vagrant/worker_token
		sudo docker swarm join-token -q manager > /vagrant/manager_token
		sudo echo "$IP" > /vagrant/manager_ip
	;;
	"manager"|"worker")
                if [ "$PAPEL" == "manager" ];
		then
			TOKEN=`cat /vagrant/manager_token`
		elif [ "$PAPEL" == "worker" ];
		then 
			TOKEN=`cat /vagrant/worker_token`
		fi
		MANAGER=`cat /vagrant/manager_ip`
		sudo docker swarm join --token $TOKEN $MANAGER:2377 >> $LOG 2>&1
	;;	
esac
