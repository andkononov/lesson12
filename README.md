# lesson12
12. Task for “Puppet Basics”

1. Using Puppet-master and client from previous chapter
2. Install https://forge.puppetlabs.com/puppetlabs/mysql/3.10.0 mysql server on your puppet client
3. Create new database called “test_mdb”, create new user “test_user”, grant “test_user” access to “test_mdb”, follow examples provided in mysql module documentation
4. Explore mysql module try to find elements described in courseware and see how the work together.  

---
# Task Steps:
## 1. Configure Vagrantfile to create two VMs:
 - Master(server)
 - Client(agent)
## 2. Add provision sections to install puppetserver on server node:
https://raw.githubusercontent.com/hopetds/lesson12/ikhamiakou/Vagrantfile
## 3. Provision executes the following scripts:
 - master.sh:
 https://github.com/hopetds/lesson12/blob/ikhamiakou/provision_scripts/master.sh
 - and client.sh:
 https://github.com/hopetds/lesson12/blob/ikhamiakou/provision_scripts/client.sh
## 4. Now VM's are almost ready:

## 5. Lets check puppetserver cert list to find out if my client node is waiting for cert:
![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/solo.png)
## 6. Signing cert:
![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/solo.png)
## 7. Run puppet agent
 - $puppet agent -t >>agentlog.txt
## 8. Verifying mysqldb:
![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/solo.png)


