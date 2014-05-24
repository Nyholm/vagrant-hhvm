class hhvm {
  package { [ 'hhvm' ]:
    ensure => 'present',
    require => Exec['apt-get update'],
  }

  file { 'server.ini' :
    path => '/etc/hhvm/server.ini',
    ensure => file,
    owner => root,
    group => root,
    source => "puppet:///modules/hhvm/server.ini",
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


  file { 'index.hh' :
    path => '/vagrant/source/index.hh',
    ensure => file,
    owner => root,
    group => root,
    source => "puppet:///modules/hhvm/index.hh",
  }

  file { '.hhconfig' :
    path => '/vagrant/source/.hhconfig',
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