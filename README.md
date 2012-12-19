Vagrant box for playing with Moniker
Assumes https://github.com/stackforge/moniker.git as been cloned into ../moniker

http://moniker.readthedocs.org/en/latest/install.html

TODO
Prototype settingup up a Python virtualenv using puppet:

* https://wiki.mozilla.org/ReleaseEngineering/How_To/Install_a_Python_Virtualenv_with_Puppet
  Booo: python::virtualenv type does not follow dependencies
* https://github.com/uggedal/puppet-module-python
  http://uggedal.com/journal/deploying-wsgi-applications-with-puppet/
  https://github.com/uggedal/puppet-module-webapp
  Yay! This supports virtualenv & dependencies via an extrenal file requirements.txt

