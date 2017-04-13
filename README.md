# lesson12
My workflow:

1. Deployed two VMs (Centos 7) from Vagrantfile
2. On the first VM edited the memory settings (2.5 GB RAM), IP, hostname (puppet-srv.minsk.epam.com) -- future puppet master
3. On the second VM changed IP, hostname (puppet-agent.minsk.epam.com) -- future puppet agent
4. Changed /etc/hosts (because VMs must see each other), disabled selinux (/etc/selinux/config -- "SELINUX=disabled"), rebooted VMs
5. Added repo for puppet-srv => rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm; yum install puppet-server
6. Added repo for puppet-agent => rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm); yum install puppet
7. Edited conf files for both VMs => vim /etc/puppet/puppet.conf (in puppet-srv added dns_alt_names=puppet-srv.minsk.epam.com in main section, in puppet-agent added server=puppet-srv.minsk.epam.com in main section)
8. Started both puppetmaster and puppet.
9. Looked at all certs on puppet-srv => puppet cert list -a
10. Signed a puppet-agent on puppet-srv => puppet cert sign puppet-agent.minsk.epam.com
11. Installed mysql with the help of puppet modules (mysql v3.10.0) => puppet module install puppetlabs-mysql
12. Created a manifest to describe a configuration => vim /etc/puppet/manifests/site.pp (is attached here)
13. On the puppet-agent performed a command to apply changes => puppet agent --test
14. Logged into database with mentioned credentials.

<<<<<<< HEAD
=======

 
>>>>>>> 241683570e3ae6c8d63d6348b9483bb61e02fd07
