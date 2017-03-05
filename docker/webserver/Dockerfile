#########################################
# Dockerfile para criar um servidor web #
# Usando Ubuntu + Apache + PHP          #
# Versao 1.0                            # 
#########################################

# Imagem que sera utilizada como base para a criacao da sua imagem customizada e, posteriomente, o seu container.
FROM ubuntu:latest

# Comandos para atualizacao dos repositorios da distribuicao
RUN apt-get update && apt-get dist-upgrade -y

# Instalar servidor web e php
RUN apt-get -y install apache2 php libapache2-mod-php git-core 
RUN apt-get clean all

# Habilitar modulo ssl do Apache (HTTPS)
RUN a2enmod ssl

# Variaveis de Ambiente
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Porta do container a ser exposta
EXPOSE 80 443

# Comando a ser executado em toda inicializacao do container
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
