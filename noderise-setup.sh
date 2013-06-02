#!/bin/bash
clear
echo '[Wellcome to nodeRISE server]'
echo '(setup can take more 5 minutes)'

#Start install prerequisite
echo '[###### Update server ######]'
sleep 1
sudo apt-get -y update
sudo apt-get -y upgrade
echo '[###### Done ######]'
sleep 1

echo '[###### Install utility tool ######]'
sleep 1
sudo apt-get install -y rcconf
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
sudo apt-get install -y git-core
echo '[###### Done ######]'
sleep 1

echo '[###### Install nodejs v0.10.9 ######]'
sleep 1
sudo mkdir /home/tmp
cd /home/tmp
sudo wget http://nodejs.org/dist/v0.10.9/node-v0.10.9.tar.gz
sudo tar xzf node-v0.10.9.tar.gz
cd node-v0.10.9
./configure --prefix=/usr
sudo make install
echo '[###### Done ######]'
sleep 1

echo '[###### Install NPM ######]'
sleep 1
cd /home/tmp
sudo git clone http://github.com/isaacs/npm.git
sudo cd npm
sudo make install
echo '[###### Done ######]'
sleep 1

echo '[###### Install Forever NPM ######]'
sleep 1
sudo npm -g install forever
sudo npm -g install forever-webui && sudo node node_modules/forever-webui/app.js
echo '[###### Done ######]'

echo '[###### Install NGINX ######]'
sleep 1
sudo apt-get -y install nginx
echo '[###### Done ######]'

cd /home

echo 'Your server has been NodeRISEd... enjoy!'

exit
