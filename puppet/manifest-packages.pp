package {'ntpdate':
	ensure	=>	latest,
}

file { 'usr/share/zoneinfo/America/Maceio':
	ensure	=>	link,
	target	=>	'/etc/localtime',
}

file {'ntpdate':
	path	=>	'/etc/default/ntpdate',
	ensure	=>	present,
	content	=>	"NTPDATE_USE_NTP_CONF=yes\nntp.ubuntu.com/pool.ntp.br,
}

package {'git-core':
        ensure  =>      latest,
}

package {'git-hub':
        ensure  =>      latest,
}

package {'apt-transport-https':
        ensure  =>      latest,
}

package {'ca-certificates':
        ensure  =>      latest,
}

package {'curl':
        ensure  =>      latest,
}

package {'software-properties-common':
        ensure  =>      latest,
}


	
