##################################################################
# Dockerfile para criar um servidor de banco de dados PostgreSQL #
# Usando Ubuntu Xenial + PostgreSQL                              #
# Versao 1.0                                                     # 
##################################################################

# Imagem que sera utilizada como base para a criacao da sua imagem customizada e, posteriomente, o seu container.
FROM ubuntu:latest

# Configurando o repositorio oficial do PostgreSQL
RUN apt-get update && apt-get -y install wget ca-certificates
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/postgresql.list

# Comandos para atualizacao dos repositorios da distribuicao
RUN apt-get update && apt-get dist-upgrade -y

# Instalar o PostgreSQL e o Git
RUN apt-get install -y python-software-properties software-properties-common postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6 git-core
RUN apt-get clean all 

# A partir daqui, todos os comandos para configurar o SGBD serao executados pelo usuario postgres
USER postgres
RUN  /etc/init.d/postgresql start &&\
     psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
     createdb -O docker docker
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.6/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.6/main/postgresql.conf

# Mapeando o volume para garantir a persistencia dos dados e facilitar o backup
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Porta do container a ser exposta
EXPOSE 5432

# Comando a ser executado em toda inicializacao do container
CMD ["/usr/lib/postgresql/9.6/bin/postgres", "-D", "/var/lib/postgresql/9.6/main", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"] 
