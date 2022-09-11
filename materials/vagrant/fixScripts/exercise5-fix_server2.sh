#!/bin/bash
#add fix to exercise5-server2 here

#take public key to "authorized keys", move private key from shared folder to home folder, now we can delete shared folder we don't need it.

cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
mv /vagrant/.ssh/id_rsa /home/vagrant/.ssh/

#go to shared dir
cd /vagrant/.ssh
#remove everything in this dir
sudo rm -v *
#remove empty dir (no need it anymore)
sudo rm -v -d /vagrant/.ssh/

#and also don't forget to take care password less and host key issues + restart ssh service!!!
sudo sed  -i  's/#   PasswordAuthentication yes/   PasswordAuthentication no/i'  /etc/ssh/ssh_config
sudo sed  -i  's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/i'  /etc/ssh/ssh_config
sudo service ssh restart
