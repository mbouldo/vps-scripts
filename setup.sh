#!/bin/bash


# set locale
localectl set-locale LANG=en_US.UTF-8 LANGUAGE="en_US:en"

# set timezone
timedatectl set-timezone America/New_York


# update
apt update -y
apt upgrade -y
apt autoremove -y
apt install -y git wget curl make

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
    addgroup dev
    adduser --disabled-password --ingroup dev ${USER}
    usermod -aG sudo ${USER}
    usermod -aG www-data ${USER}
    mkdir -p /home/${USER}/.ssh
    #get root keys (the keys you give to digital ocean and they give back to you)
    curl https://github.com/${GITHUB}.keys > /home/${USER}/.ssh/authorized_keys 
    chown -R ${USER}:dev /home/${USER}/.ssh
    chmod 700 /home/${USER}/.ssh
    chmod 600 /home/${USER}/.ssh/authorized_keys 
done




