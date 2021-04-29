#!/bin/bash

#nginx
apt install -y nginx
systemctl enable nginx
systemctl start nginx

ufw allow http
ufw allow https
sudo ufw allow 'Nginx HTTP'

mkdir -p /var/www/html
chown -R www-data:www-data /var/www
chmod -R g+rwX /var/www
chmod 2775 /var/www

#mysql
apt install mysql-server
mysql_secure_installation

#php
apt install php-fpm php-mysql

wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/sp/default_config
echo Enter Domain: 
read domain
mv default_config $domain
sed -i "s/your_domain/${domain}/g" $domain

php_ver_sock="$(find /var/run/php/php[0-9]*fpm.sock)"

sed -i "s@PHP_VER_SOCKFILE@${php_ver_sock}@g" $domain

mv $domain /etc/nginx/sites-available/$domain

ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/
unlink /etc/nginx/sites-enabled/default
nginx -t
systemctl reload nginx

