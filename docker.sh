#!/bin/bash

echo What user will create this docker?
read username


sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
apt-cache policy docker-ce -y

sudo apt install docker-ce -y
sudo apt-get install docker-compose -y

sudo usermod -aG docker ${username}
su $username

sudo apt-get install nginx -y

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


wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/ghost_configs/nginx_conf
sed -i "s/__DOMAIN__/${domain}/g" nginx_conf
mv nginx_conf $domain
mv $domain /etc/nginx/sites-available/$domain
ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/
unlink /etc/nginx/sites-enabled/default

systemctl reload nginx

sed -i "s/__DOMAIN__/${domain}/g" docker-compose.yml
sed -i "s/__PROJECT_NAME__/${project_name}/g" docker-compose.yml
sed -i "s/__MYSQL_ROOT_PASSWORD__/${mysql_root_password}/g" docker-compose.yml
sed -i "s/__MYSQL_USER_PASSWORD__/${mysql_user_password}/g" docker-compose.yml

mv docker-compose.yml ~/$project_name/
cd ~/$project_name/

docker-compose up -d
docker ps


