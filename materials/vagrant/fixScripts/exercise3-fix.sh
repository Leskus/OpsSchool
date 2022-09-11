#!/bin/bash
#add fix to exercise3 here

sudo sed -i 's/all denied/all granted/i'  /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart
