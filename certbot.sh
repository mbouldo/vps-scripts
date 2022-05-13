#!/bin/bash
sudo apt install snapd
sudo snap install --classic certbot

sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'

#Accept all Y, add email & pick 2

echo Enter Domain: 
read domain
sudo certbot --nginx -d $domain -d www.$domain
sudo systemctl status snap.certbot.renew.timer
