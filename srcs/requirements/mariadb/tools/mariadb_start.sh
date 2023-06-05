#!/bin/bash

service mysql start

if [ ! -d /var/lib/mysql/$DB_NAME ];
then
	mysql -u root -e "CREATE DATABASE $DB_NAME;"
	mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
fi