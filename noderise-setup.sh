#!/bin/bash

script_runner=$(whoami)

if [ $script_runner == "root" ] ; then
  echo -e "\nFor security reasons this script must be run as a normal user with sudo privileges\n"
  exit 1
fi

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
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
sudo apt-get install -y git-core
sudo apt-get install -y curl
sudo apt-get install -y mc
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
echo '[###### Done ######]'
sleep 1


echo '{###### Setup Directories ######]'
sleep 1
sudo mkdir ~/apps
sudo mkdir ~/apps/startup
sudo cp ~/noderise/app-starter.sh ~/apps/startup/app-starter.sh
sudo chmod 700 ~/apps/startup/app-starter.sh
sudo @reboot ~/apps/startup/app-starter.sh >> cron.log 2>&1
echo '{###### Done #####]'
sleep 1

sudo rm -rf /home/tmp/*

cd ~/

echo 'Your server has been NodeRISEd... enjoy!'

exit
