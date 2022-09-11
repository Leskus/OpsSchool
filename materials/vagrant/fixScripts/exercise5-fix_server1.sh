#!/bin/bash
#add fix to exercise5-server1 here


#generate keys, make shared folder --> copy generated keys to shared folder, take care password less and host key issues +  restart service!!!

ssh-keygen -t rsa -N '' -f /home/vagrant/.ssh/id_rsa
mkdir /vagrant/.ssh
cp /home/vagrant/.ssh/id_rsa* /vagrant/.ssh/

#cat /etc/ssh/ssh_config
sudo sed  -i  's/#   PasswordAuthentication yes/   PasswordAuthentication no/i'  /etc/ssh/ssh_config
sudo sed  -i  's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/i'  /etc/ssh/ssh_config
sudo service ssh restart
