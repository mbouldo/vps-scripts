#!/bin/bash

#nginx
apt install -y nginx
systemctl enable nginx
systemctl start nginx

ufw allow http
ufw allow https
sudo ufw allow 'Nginx HTTP'


sudo chgrp -R dev /var/www
sudo chmod -R g=rwX /var/www/
sudo find /var/www -type f -exec chmod 664 {} \;
sudo find /var/www -type d -exec chmod 775 {} \;
sudo find /var/www -type d -exec chmod g+s {} \;

#mysql
apt install -y mysql-server
mysql_secure_installation

#php
apt install -y php-fpm php-mysql

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
mkdir /var/www/${domain}
wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/sp/index.php -P /var/www/${domain}
systemctl reload nginx

