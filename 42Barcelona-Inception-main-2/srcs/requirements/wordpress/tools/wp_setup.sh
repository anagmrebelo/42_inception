#!/bin/bash
if [ ! -f "/var/www/html/config.php" ]; then
	echo "Seting up wordpress"
	cd /var/www/html
	echo "Setting Up Admin User $WP_ADMIN_USER - $WP_ADMIN_PASSWORD"
	echo "Setting Up User $WP_USER - $WP_USER_PASSWORD"
	wp core download --allow-root
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
	wp theme install storia --activate --allow-root
else
	echo "Wordpress allready configured"
fi
echo "Wordpress Up & Runnnig"
/usr/sbin/php-fpm7.3 -F