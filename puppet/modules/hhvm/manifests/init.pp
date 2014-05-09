class hhvm {
	package { [ 'hhvm' ]:
		ensure => 'present',
		require => Exec['apt-get update'],
	}

	file { 'config.hdf' :
		path => '/etc/hhvm/config.hdf',
		ensure => file,
		owner => root,
		group => root,
		source => "puppet:///modules/hhvm/config.hdf",
		require => Package['hhvm'],
		notify => Service['hhvm'],
	}

	file { 'hhvm.local' :
		path => '/etc/nginx/sites-enabled/hhvm.local',
		ensure => file,
		owner => root,
		group => root,
		source => "puppet:///modules/hhvm/hhvm.local",
		require => Package['nginx'],
		notify => Service['nginx'],
	}


	file { 'index.php' :
		path => '/var/www/index.php',
		ensure => file,
		owner => root,
		group => root,
		source => "puppet:///modules/hhvm/index.php",
	}

    file { '.hhconfig' :
      path => '/var/www/.hhconfig',
      ensure => file,
    }

	service { 'hhvm':
		ensure => running,
		enable => true,
		require => Package['hhvm'],
  		binary     => '/usr/bin/hhvm',
  		hasrestart => true,
  		hasstatus  => false,
	}
}
