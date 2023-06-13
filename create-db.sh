#!/bin/bash

# Collect database name, username, and password from the user
read -p "Enter the database name: " db_name
read -p "Enter the username: " username
read -s -p "Enter the password: " password
echo

# Create the database on localhost
mysql -u root -p -e "CREATE DATABASE ${db_name}; GRANT ALL PRIVILEGES ON ${db_name}.* TO '${username}'@'localhost' IDENTIFIED BY '${password}'; FLUSH PRIVILEGES;"

echo "Database '${db_name}' created successfully."
