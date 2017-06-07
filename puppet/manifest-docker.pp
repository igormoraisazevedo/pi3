# Manifesto criado para instalação e 
# controle do serviço docker

# Instalação de dependência

package { 'libopts25':
	ensure	=>	latest,
}

# Instalação do docker-engine

package { 'docker-engine':
        ensure  =>      latest,
}

# Declaração do estado do serviço Docker

service { 'docker':
	ensure	=>	running,
	enable	=>	true,
}
