# remove /var/www
tidy { "/var/www":
  rmdirs => true
}

file { '/var/www':
  ensure => 'link',
  target => '/vagrant/source',
  require => Tidy["/var/www"]
}

class { 'sources': }
class { 'update': }
class { 'mysql': }
class { 'nginx': }
class { 'hhvm': }