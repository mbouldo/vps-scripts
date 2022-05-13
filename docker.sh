#!/bin/bash




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
