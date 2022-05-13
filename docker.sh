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


wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/ghost_configs/docker-compose.yml
echo Enter Your Domain: 
read domain
echo Enter Your Project Name: 
read project_name
echo Enter Your mySQL Root Password:
read mysql_root_password
echo Enter your mySQL User Password:
read mysql_user_password

sed -i "s/__DOMAIN__/${domain}/g" docker-compose.yml
sed -i "s/__PROJECT_NAME__/${project_name}/g" docker-compose.yml
sed -i "s/__MYSQL_ROOT_PASSWORD__/${mysql_root_password}/g" docker-compose.yml
sed -i "s/__MYSQL_USER_PASSWORD__/${mysql_user_password}/g" docker-compose.yml
docker-compose up -d
docker ps

https://raw.githubusercontent.com/mbouldo/vps-scripts/master/ghost_configs/nginx_conf
sed -i "s/__DOMAIN__/${domain}/g" nginx_conf
mv nginx_conf $domain
mv $domain /etc/nginx/sites-available/$domain
ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/
unlink /etc/nginx/sites-enabled/default

systemctl reload nginx
