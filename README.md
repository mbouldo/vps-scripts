# vps-scripts
bash vps setup scripts

wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/setup.sh; chmod +x setup.sh

 scp filename.png martin@123.123.123.123:/var/www/website.com

#Do this before hardening
passwd USERNAME
>> prompt to set password

#To pull from SSH

ssh-agent bash -c 'ssh-add /home/USERNAME/.ssh/authorized_keys; git clone git@github.com:user/project.git'

to push:
git push origin main:main

# Github ver. (2)
ssh-keygen -o 
// accept default file path w/ respect to your user.
cat /home/martin/.ssh/id_rsa.pub
//paste key into github settings
ssh -T git@github.com
//test connection
cd /your/projectd/directory
git init
git remote add origin git@github.com:mbouldo/NHSTF.git
git status
//will give you every file that has been changed in previous round.
git add .
//track all files in directory, might take a while if big repo
git config --global user.email "mbouldo@gmail.com"
git config --global user.name "Martin B"

git commit -m "First Commit"
git push --set-upstream origin master

//next changes?
git add .
git commit -m "Desc"
git push



#make sure you are in foder, make sure you have a key assoc.


give user permission to www-data:


sudo chown -R yourname:www-data /var/www/pathtowebsite.com

sudo chmod -R g+s /var/www/pathtowebsite.com


## create your first mysql database with server
sudo mysql

CREATE DATABASE IF NOT EXISTS db_name_here;

CREATE USER 'user_name_here'@'localhost' IDENTIFIED BY 'password_here';

GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';

FLUSH PRIVILEGES;

# tunnel in with terminal

ssh -L13306:localhost:3306 user@159.000.00.00
 
## create a backup of a database
sudo mysqldump db_name > backup-file.sql
(this will save it to your current directory)

> then create a database w/ a name on new server
 sudo mysql db_name < file.sql
