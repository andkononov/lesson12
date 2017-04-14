sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
sudo yum install -y puppet-agent
sudo echo "server=server.minsk.epam.com" >> /etc/puppetlabs/puppet/puppet.conf
sudo systemctl start  puppet.service
sudo echo "192.168.0.5	server  server.minsk.epam.com" >> /etc/hosts
sudo systemctl restart network
