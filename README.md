# vps-scripts
bash vps setup scripts

#Do this before hardening
passwd USERNAME
>> prompt to set password

#To pull from SSH

ssh-agent bash -c 'ssh-add /home/USERNAME/.ssh/authorized_keys; git clone git@github.com:user/project.git'

to push:
git push origin main:main

#make sure you are in foder, make sure you have a key assoc.
