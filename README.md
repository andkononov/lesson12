# lesson12
---
# Task Steps:
## 1. Configure Vagrantfile to create two VMs:
 - Master(server)
 - Client(agent)
## 2. Add provision sections to install puppetserver and puppet agent as well as [MySql](https://github.com/hopetds/lesson12/blob/ikhamiakou/provision_scripts/master.sh) module for puppet:
![alt tag](https://raw.githubusercontent.com/hopetds/lesson12/ikhamiakou/pics/vagrant.png)
## 3. Provision executes the following scripts:
- [master.sh]( https://github.com/hopetds/lesson12/blob/ikhamiakou/provision_scripts/master.sh)

---

![alt tag](https://raw.githubusercontent.com/hopetds/lesson12/ikhamiakou/pics/mastersh.png)
- [client.sh](https://github.com/hopetds/lesson12/blob/ikhamiakou/provision_scripts/client.sh)

---

![alt tag](https://raw.githubusercontent.com/hopetds/lesson12/ikhamiakou/pics/clientsh.png)
## 4. Run vagrant up. Wait for provisioning and then ssh to both nodes:
 - vagrant ssh master
 - vagrant ssh client
## Now lets check puppetserver cert list to find out if my client node is waiting for cert:
![alt tag](https://raw.githubusercontent.com/hopetds/lesson12/ikhamiakou/pics/certlist.png)
## 5. Signing cert:
![alt tag](https://raw.githubusercontent.com/hopetds/lesson12/ikhamiakou/pics/certsigned.png)
## 6. Run puppet agent
 - puppet agent -t >>agentlog.txt
 Here is my [agentlog](https://github.com/hopetds/lesson12/blob/ikhamiakou/agentlog.txt)
## 7. Verifying mysqldb:
![alt tag](https://raw.githubusercontent.com/hopetds/lesson12/ikhamiakou/pics/showdatabases.png)


