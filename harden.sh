#!/bin/bash

#harden your server
cat << "EOF"
 _____ _____ _____  __   _______ _   _______  ______  ___   _____ _____  _    _  _________________ 
/  ___|  ___|_   _| \ \ / /  _  | | | | ___ \ | ___ \/ _ \ /  ___/  ___|| |  | ||  _  | ___ \  _  \
\ `--.| |__   | |    \ V /| | | | | | | |_/ / | |_/ / /_\ \\ `--.\ `--. | |  | || | | | |_/ / | | |
 `--. \  __|  | |     \ / | | | | | | |    /  |  __/|  _  | `--. \`--. \| |/\| || | | |    /| | | |
/\__/ / |___  | |     | | \ \_/ / |_| | |\ \  | |   | | | |/\__/ /\__/ /\  /\  /\ \_/ / |\ \| |/ / 
\____/\____/  \_/     \_/  \___/ \___/\_| \_| \_|   \_| |_/\____/\____/  \/  \/  \___/\_| \_|___/     


ctrl+c to stop the script then use passwd account_name
EOF
echo Press any key to continue...
read cont


wget https://raw.githubusercontent.com/mbouldo/vps-scripts/master/sp/sshd_config
mv sshd_config /etc/ssh/sshd_config

apt-get install -y fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

sed -i "s/# \[sshd\]/\[sshd\]/g" /etc/fail2ban/jail.local
sed -i "s/# enabled = true/enabled = true/g" /etc/fail2ban/jail.local
fail2ban-client start
systemctl enable fail2ban
sudo systemctl restart sshd
sudo systemctl restart ssh # might be required if installed incorrectly.
