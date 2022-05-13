#!/bin/bash

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce

sudo apt install docker-ce
sudo apt-get install docker-compose


sudo apt-get install nginx

sudo ufw allow 'Nginx Full'


wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/sp/default_config
echo Enter Domain: 
read domain
mv default_config $domain
sed -i "s/your_domain/${domain}/g" $domain
