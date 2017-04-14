sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
sudo yum install -y puppetserver
sudo systemctl start puppetserver
sudo echo "192.168.0.2	client  client.minsk.epam.com" >> /etc/hosts
sudo systemctl restart network
