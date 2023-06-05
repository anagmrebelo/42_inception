#!/bin/bash

cd /var/www/html
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST


/usr/sbin/php-fpm7.4 -F