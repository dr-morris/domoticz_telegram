#!/bin/bash

#Install configuration
TargetDir=/home/pi/telegram

echo Installing Telegram on your PI
echo Installation will take a couple of minutes

#######
####TMP
#++ rm -rf $TargetDir
#######



#Prepare directories
mkdir $TargetDir 
cd $TargetDir
mkdir scripts
mkdir scripts/tmp

#Install needed packages
sudo apt-get update
sudo apt-get install git-core
sudo apt-get install make
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev

#Install Telegram
git clone https://github.com/vysheng/tg.git 
cd tg
./configure
make
#++ cd $TargetDir/tg && ./telegram -k tg-server.pub


#Install JQ (JSon parser) (it will complain about Ruby Dependencies, no issue
cd $TargetDir
wget http://stedolan.github.io/jq/download/source/jq-1.4.tar.gz
tar -zxvf jq-1.4.tar.gz
rm jq-1.4.tar.gz
cd jq-1.4
./configure 
make 
sudo make install

#Install generic scripting
cd $TargetDir
mkdir scripts/generic

#Install user scripts
cd $TargetDir
mkdir scripts/user
