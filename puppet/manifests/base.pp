
package { 'rabbitmq-server': }
package { 'git': }
# optional, only needed if you are going to run the bind backend
package { 'bind9': 
  # make sure we do an "apt-get update" to refresh the apt repo metadata
  require => Exec['apt-get update'],
}

exec { 'apt-get update':
  path    => ['/usr/bin', '/usr/sbin'],
}

# install at the global level, not in the venv environment
# (the pip provider is in puppet 2.7+)
package {'tox': provider => pip }

class { 'moniker::venv': }
