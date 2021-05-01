#!/bin/bash
sudo apt install -y certbot python3-certbot-nginx
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'

#Accept all Y, add email & pick 2

echo Enter Domain: 
read domain
sudo certbot --nginx -d $domain -d www.$domain
sudo systemctl status certbot.timer
