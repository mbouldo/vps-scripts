#/bin/bash

echo Enter current domain name:
read old_domain
echo Enter new domain name:
read new_domain

echo Removing certbot from $old_domain
certbot delete --cert-name $old_domain

wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/sp/default_config

mv default_config $new_domain
sed -i "s/your_domain/${new_domain}/g" $new_domain

php_ver_sock="$(find /var/run/php/php[0-9]*fpm.sock)"

sed -i "s@PHP_VER_SOCKFILE@${php_ver_sock}@g" $new_domain

mv $new_domain /etc/nginx/sites-available/$new_domain

ln -s /etc/nginx/sites-available/$new_domain /etc/nginx/sites-enabled/

nginx -t

rm /etc/nginx/sites-available/$old_domain
rm /etc/nginx/sites-enabled/$old_domain

mv /var/www/$old_domain /var/www/$new_domain

systemctl restart nginx

echo Transfer complete. Do not forget to apply new certificate to domain!
