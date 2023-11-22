#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ];
then 
	cd /var/www/html
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
	wp core install --url=$WP_DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_EMAIL --allow-root
	wp user create $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=editor --allow-root
fi

/usr/sbin/php-fpm7.4 -F