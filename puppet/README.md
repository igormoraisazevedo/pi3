Arquivos para a utilização do Puppet
O Puppet foi aplicado as VMs para gerenciamento básico da configuração.
Comandos mais utilizados no puppet:

Realizar a aplicação de um manifesto:
# puppet apply arquivo.pp

Testar a aplicação de um manifeto:
# puppet apply --noop arquivo.pp

Realizar a edição de algum atributo de usuario:
# puppet resource user nome do user --edit

Realizar a edição de algum atributo de pacotes:
# puppet resource package nome do pacote --edit

Realizar a instalação de algum módulo puppet:
# puppet module install nome do módulo

# ***Para se aprofundar quanto a utilização do puppet leia a apostila feita pela comunidade puppet br localizada nesse diretório***
