#!/bin/bash

service mysql start
#mysql -u root -e "CREATE DATABASE $DB_NAME;"
#mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
#mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"

#mysqld

# If container restarts database is created again?