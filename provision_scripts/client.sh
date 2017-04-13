rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm &>/dev/null
echo "<<<<<<<<<<<Added repo for puppet-agent"
yum install -y puppet-agent &>/dev/null
echo "192.168.33.33 master.minsk.epam.com" >> /etc/hosts
echo "server = master.minsk.epam.com" > /etc/puppetlabs/puppet/puppet.conf
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true &>/dev/null
echo " -----------Puppet client is ready------------ "