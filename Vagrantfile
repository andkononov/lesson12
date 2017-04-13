# -*- mode: ruby -*-
# vi: set ft=ruby :



Vagrant.configure("2") do |config|



    config.vm.define "server" do |server|
        server.vm.box = "centos/7"          # choosing box
        server.vm.hostname="server"                                                    # hostname 
        server.vm.network :public_network, bridge:"eno1"                                    # external network config
        server.vm.network :private_network, ip: "192.168.50.4"                              # private network config
        server.vm.provider :virtualbox do |v|
            v.customize ["modifyvm",:id, "--memory",4096]                                   # memory 
        end
        server.vm.synced_folder "/home/student/puppet/puppet_server", "/puppet", type: "rsync"
    end




    config.vm.define "client1" do |client1|
        client1.vm.box = "centos/7"         # choosing box
        client1.vm.hostname='client1'                                                  # hostname
        client1.vm.network :public_network, bridge:"eno1"                                   # external network config
        client1.vm.network :private_network, ip: "192.168.50.3"                             # private network config
        client1.vm.provider :virtualbox do |v|
            v.customize ["modifyvm",:id, "--memory",2048]                                   # memory setup # why "v"
        end
        client1.vm.synced_folder "/home/student/puppet/puppet_server", "/puppet", type: "rsync"
    end




    config.vm.define "client2" do |client2|
        client2.vm.box = "centos/7"         # choosing box
        client2.vm.hostname='client2'                                                  # hostname
        client2.vm.network :public_network, bridge:"eno1"                                   # external network config
        client2.vm.network :private_network, ip: "192.168.50.2"                             # private network config
        client2.vm.provider :virtualbox do |v|
            v.customize ["modifyvm",:id, "--memory",2048]                                   # memory setup # why "v"
        end
        client2.vm.synced_folder "/home/student/puppet/puppet_server", "/puppet", type: "rsync"
    end



end