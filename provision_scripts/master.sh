rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm &>/dev/null
echo "<<<<<<<<<<<Added repo for puppetserver"

yum install -y puppetserver &>/dev/null
echo "<<<<<<<<<<<Puppetserver installed"


puppet module install puppetlabs-mysql --version 3.10.0 &>/dev/null
cp /vagrant/site.pp /etc/puppetlabs/code/environments/production/manifests/
echo "Mysql module v3.10.0 is installed"

echo "192.168.33.34 client.minsk.epam.com" >> /etc/hosts

echo "Starting Puppetserver..."
systemctl restart puppetserver

echo "Started"
echo " -----------Puppet master is ready------------ "