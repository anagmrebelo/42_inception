#!/bin/bash

service mysql start

if [ ! -d /var/lib/mysql/$DB_NAME ];
then
	mysql -u root -e "CREATE DATABASE $DB_NAME;"
	mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'";
fi