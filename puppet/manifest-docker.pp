package { 'libopts25':
	ensure	=>	latest,
}

package { 'docker-engine':
        ensure  =>      latest,
}

service { 'docker':
	ensure	=>	running,
	enable	=>	true,
}
