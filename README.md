# vps-scripts
bash vps setup scripts

#Do this before hardening
passwd USERNAME
>> prompt to set password

#To pull from SSH

ssh-agent bash -c 'ssh-add /home/USERNAME/.ssh/authorized_keys; git clone git@github.com:user/project.git'
