# Manifesto criado para edição
# de entradas de nomes e endereços ip no
# arquivo /etc/hosts linux

host { 'localdomain':
	ip	=>	'127.0.1.1',
	host_aliases	=>	'localdomain',
}

host { 'manager.localdomain':
	ip	=>	'192.168.10.10',
	host_aliases    =>      'manager',
}

host { 'worker1.localdomain':
	ip      =>      '192.168.10.20',
	host_aliases    =>      'worker1',
}

host { 'worker2.localdomain':
	ip      =>      '192.168.10.30',
        host_aliases    =>      'worker2',
}
