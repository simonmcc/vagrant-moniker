
# http://moniker.readthedocs.org/en/latest/install.html#common-steps
package { 'python-pip': }
package { 'python-virtualenv': }
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

exec { 'install-python-lxml-deps':
  command => 'apt-get build-dep --yes python-lxml',
  cwd     => '/opt/stack/moniker',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Package['python-pip', 'python-virtualenv', 'rabbitmq-server', 'bind9'],
}

# install at the global level, not in the venv environment
# (the pip provider is in puppet 2.7+)
package {'tox': provider => pip }

# virtualenv is setup up in the directory above our vboxfs mount of the moniker repo on the host
# as the virtualenv environment relies on symlinks which don't work on vboxfs mounts
exec { 'setup-moniker-venv':
  command => 'virtualenv .venv ; . .venv/bin/activate ; cd /opt/stack/moniker ; pip install -rtools/setup-requires -rtools/pip-requires -rtools/pip-options',
  cwd     => '/opt/stack',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['install-python-lxml-deps'],
}
