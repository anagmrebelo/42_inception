#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ];
then 
	cd /var/www/html
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
	wp core install --url=$WP_DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWPRD --admin_email=$WP_EMAIL --allow-root
fi

/usr/sbin/php-fpm7.4 -F