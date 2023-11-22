#!/bin/bash

service mariadb start

if [ ! -d /var/lib/mysql/$DB_NAME ];
then
	mariadb -u root -e "CREATE DATABASE $DB_NAME;"
	mariadb -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	mariadb -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"
	mariadb -u root -e "FLUSH PRIVILEGES;"
	mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'";
fi