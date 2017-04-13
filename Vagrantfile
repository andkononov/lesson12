# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "puppet-serv" do |serv|
	serv.vm.hostname = "puppet-serv.minsk.epam.com"
	serv.vm.box = "centos7"
	serv.vm.network "private_network", ip: "192.168.10.30"
	serv.vm.provider "virtualbox" do |server|
	  server.name = "puppet-serv"
	  server.cpus = 2
	  server.memory = 3000
	end
	
	serv.vm.provision "shell", inline: <<-SHELL
	sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
	sudo yum install -y puppetserver
	sudo systemctl restart network
 	sudo cp /vagrant/autosign.conf /etc/puppetlabs/puppet 	
	sudo systemctl start puppetserver
        sudo puppet module install puppetlabs-mysql --version 3.10.0
	sudo cp /vagrant/site.pp /etc/puppetlabs/code/environments/production/manifests
	echo " === Provision puppet-serv.minsk.epam.com complete === "
	SHELL
  end

  config.vm.define "node1" do |node1|
	node1.vm.hostname = "node1.minsk.epam.com"
	node1.vm.box = "centos7"
	node1.vm.network "private_network", ip: "192.168.10.40"
	node1.vm.provider "virtualbox" do |node|
	  node.name = "node1"
	  node.cpus = 2
	  node.memory = 2048

	end
	
	node1.vm.provision "shell", inline: <<-SHELL
	sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
	yum install -y puppet-agent
	echo "server = puppet-serv.minsk.epam.com" >> /etc/puppetlabs/puppet/puppet.conf
	echo "192.168.10.30 puppet-serv.minsk.epam.com" >> /etc/hosts
	sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
	sudo /opt/puppetlabs/bin/puppet agent --test	
	echo " === Provision node1.minsk.epam.com complete === "
	SHELL

  end

	
  

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
