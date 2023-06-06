FROM debian:bullseye

# Install PHP
RUN apt-get update -y
RUN apt-get install\
	php\
	php-fpm\
	curl\
	php-mysqli\
	mariadb-client\
	-y

# Create a folder where php and php-fm run
RUN	mkdir /run/php
RUN chmod 755 /run/php

# Create WP setup script
COPY ./tools/wordpress_start.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/wordpress_start.sh

# Install Wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Substitutes the conf file to listen to port 9000
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/wordpress_start.sh" ]
