# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # define box to use
  config.vm.box = 'sbeliakou/centos-7.2-x86_64'

  # define puppet master server
  config.vm.define 'master' do |master|
    master.vm.hostname = 'master.lab'
    master.vm.network 'private_network', ip: '192.0.0.100'
    master.vm.provider 'virtualbox' do |v|
      v.name = 'master'
      v.memory = 3072
      v.cpus = 1
      v.linked_clone = true
    end
    master.vm.provision 'shell', inline: <<-SHELL
      nmcli connection reload
      systemctl restart network.service
      grep client /etc/hosts
      [ $? -ne 0 ] && echo "192.0.0.105 client.lab" >> /etc/hosts
	    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
      yum install -y puppetserver
      /bin/cp /vagrant/site.pp /etc/puppetlabs/code/environments/production/manifests
      /bin/cp /vagrant/autosign.conf /etc/puppetlabs/puppet/
      systemctl restart puppetserver
      source ~/.bashrc
      puppet module install puppetlabs-mysql --version 3.10.0
      SHELL
  end

  # define puppet client vm
  config.vm.define 'client' do |client|
    client.vm.hostname = 'client.lab'
    client.vm.network 'private_network', ip: '192.0.0.105'
    client.vm.provider 'virtualbox' do |v|
      v.name = 'client'
      v.memory = 1024
      v.cpus = 1
      v.linked_clone = true
    end
    client.vm.provision 'shell', inline: <<-SHELL
      nmcli connection reload
      systemctl restart network.service
      grep master /etc/hosts
      [ $? -ne 0 ] && echo "192.0.0.100 master.lab" >> /etc/hosts
      rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
      yum install -y puppet-agent
      /bin/cp /vagrant/puppet.conf /etc/puppetlabs/puppet/
      source ~/.bashrc
      puppet agent -t
    SHELL
  end
end
