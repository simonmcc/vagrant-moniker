#!/bin/sh
# 
# run puppet, to be used inside the VM

puppet apply $* --modulepath /vagrant/puppet/modules /vagrant/puppet/manifests/base.pp
