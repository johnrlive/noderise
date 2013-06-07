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
sudo apt-get install -y python-software-properties
sudo apt-get install -y python 
sudo apt-get install -y g++ 
sudo apt-get install -y make
echo '[###### Done ######]'
sleep 1

echo '[###### Install nodejs from repo ######]'
sleep 1
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get install -y nodejs
echo '[###### Done ######]'
sleep 1

echo '[###### Install NPM ######]'
sleep 1
sudo apt-get install -y npm
echo '[###### Done ######]'
sleep 1

echo '[###### Install NPM's ######]'
sleep 1
sudo npm -g install forever
sudo npm -g install express
echo '[###### Done ######]'
sleep 1

echo '{###### Setup Directories ######]'
sleep 1
sudo mkdir ~/apps
sudo mkdir ~/apps/startup
sudo cp ~/noderise/app-starter.sh ~/apps/startup/app-starter.sh
sudo chmod 700 ~/apps/startup/app-starter.sh
echo '{###### Done #####]'
sleep 1


cd ~/

echo $NODE_PATH
echo $NPM_PATH
echo 'Your server has been NodeRISEd... enjoy!'

exit
