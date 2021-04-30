#!/bin/bash

# set locale
localectl set-locale LANG=en_US.UTF-8 LANGUAGE="en_US:en"

# set timezone
timedatectl set-timezone UTC

# update
apt update -y
apt upgrade -y
apt autoremove -y
apt install -y git wget curl make vim unzip

# firewall
ufw allow ssh
ufw enable

# set users

#USER_N name, github account for SSH
USER_1=("martin" "mbouldo")
USER_2=("idean" "clevlandpink")

USERS=(
  USER_1[@]
  USER_2[@]
)

# Loop and print it.  Using offset and length to extract values
COUNT=${#USERS[@]}
for ((i=0; i<$COUNT; i++))
do
    USER=${!USERS[i]:0:1}
    GITHUB=${!USERS[i]:1:1}
    
    
    adduser --disabled-password ${USER}
    usermod -aG sudo ${USER}
    usermod -aG www-data ${USER}
    mkdir -p /home/${USER}/.ssh

    #get github keys
    curl https://github.com/${GITHUB}.keys > /home/${USER}/.ssh/authorized_keys 
    chown -R ${USER}:${USER} /home/${USER}/.ssh
    chmod 700 /home/${USER}/.ssh
    chmod 600 /home/${USER}/.ssh/authorized_keys 
done


git clone https://github.com/mbouldo/vps-scripts.git
chmod +x vps-scripts/*.sh


