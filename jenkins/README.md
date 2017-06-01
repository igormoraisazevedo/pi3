Arquivos para a utilização do Jenkins

Para a realização do controle de testes com o Jenkins, o ambiente utilizado foi o seguinte:

- 1GB de RAM
- 12 GB de espaço em disco
- Debian Jessie v.8.7.1 (x64)
- Jenkins 2.46.2 - Última versão até o momento da realização da instalação

Os binários do Jenkins foram baixados diretamente do repositório oficial com os seguintes comandos:

Comando para adicionar as chaves do repositório ao sistema.
	wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

Em seguida adiciona o endereço do repositório do pacote no sources.list com  o comando:
	echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

Quando o repositório for adicionado, realize um update com o comando:
	sudo apt-get update
  
Ao término da atualização, finalmente o Jenkins poderá ser instalado:
 	sudo apt-get install jenkins
  
Agora que as dependências e o Jenkins foram instalados com sucesso, é hora de iniciar o serviço:
	sudo systemctl start jenkins
  
Para verificar se o serviço foi iniciado com sucesso, rode o comando a seguir:
	sudo systemctl status jenkins
 
A saída deverá ser algo como abaixo:
  	● jenkins.service - LSB: Start Jenkins at boot time
  	   Loaded: loaded (/etc/init.d/jenkins)
	   Active: active (running) since Thu 2017-06-01 11:49:06 -03; 32min ago
	   Process: 483 ExecStart=/etc/init.d/jenkins start (code=exited, status=0/SUCCESS)
   	  CGroup: /system.slice/jenkins.service
            ├─751 /usr/bin/daemon --name=jenkins --inherit --env=JENKINS_HOME=/var/lib/jenkins --output=/var/log/jenkins/jenkins.log --pidfile=/var/...
            └─752 /usr/bin/java -Djava.awt.headless=true -jar /usr/share/jenkins/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080
           
Por ser um serviço onde o gerenciamento é via web, é necessário que a porta 8080, comumente utlizada por padrão seja liberada:
	sudo ufw allow 8080

Pode verificar com o comando abaixo se a porta foi liberada com sucesso:
	sudo ufw status

Para configurar a instalação do Jenkins, acesse o endereço via navegador web:
	http://ip_do_servidor_jenkins:8080
  
No primeiro acesso via navegador web, será necessário realizar o desbloqueio do diretório do Jenkins conforme figura abaixo:
![alt text](https://assets.digitalocean.com/articles/jenkins-install-ubuntu-1604/unlock-jenkins.png)
	
A chave do administrador que é requerida poderá ser visualizada com o seguinte comando no terminal:
	sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Basta copiar os 32 caracteres e colar no campo solicitado.
Em seguida será solicitado o tipo de configuração desejada:
![alt text](https://assets.digitalocean.com/articles/jenkins-install-ubuntu-1604/jenkins-customize.png)

Poderá ser escolhido o modo padrão clicando em “Install suggested plugins”, serão instalados os plugins padrões para o Jenkins dentre eles o de integração do Git, Docker, Java, Ldap dentre outros vários. Se souber exatamente os plugins que deseja instalar, selecione a opção “Select plugins to install” e na tela seguinte será questionado sobre quais os plugins que deseja instalar.

Selecionando a opção default, será exibida a tela com o progresso da instalação dos plugins:
![alt text](https://assets.digitalocean.com/articles/jenkins-install-ubuntu-1604/jenkins-plugins.png)

Ao término da instalação dos plugins, será redirecionado para a tela de criação do primeiro usuário:
![alt text](https://assets.digitalocean.com/articles/jenkins-install-ubuntu-1604/jenkins-first-admin.png)

Ao informar os dados solicitados, basta clicar em “Save and Finish”.

Essa é a tela de confirmação do sucesso das configurações.
![alt text](https://assets.digitalocean.com/articles/jenkins-install-ubuntu-1604/jenkins-ready.png)
![alt text](https://assets.digitalocean.com/articles/jenkins-install-ubuntu-1604/jenkins-using.png)


