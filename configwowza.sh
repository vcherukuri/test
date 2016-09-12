#!/bin/bash
#arguments: username, storage account, access key, container name
#Install azure CLI for storage 
sudo su
cd /home/$1
sudo apt-get update
sudo apt-get install -y npm
wget http://aka.ms/linux-azure-cli
sudo npm install -g linux-azure-cli
sudo ln -s /usr/bin/nodejs /usr/bin/node
azure telemetry --disable

export AZURE_STORAGE_ACCOUNT=$2
export AZURE_STORAGE_ACCESS_KEY=$3
export CONTAINER_NAME=$5
export DESTINATION_FOLDER=/usr/local/WowzaStreamingEngine/content/
#export BLOB_NAME=$6

#configure admin password
cd /usr/local/WowzaStreamingEngine/conf
sudo chmod 777 admin.password
echo "wowza  Sysgainhyd@123  admin" > admin.password
#configure stream publish password
sudo chmod 777 publish.password
echo "wowza Sysgainhyd@123" > publish.password
#download the video from azure blob
#azure storage blob download $CONTAINER_NAME video1.mp4 /usr/local/WowzaStreamingEngine/content/video1.mp4
