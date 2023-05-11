FROM debian:bullseye

# Install PHP
RUN apt-get update -y
RUN apt-get install php\
	php-fpm\
	-y

# Create a folder where php and php-fm run
RUN	mkdir /run/php
RUN chmod 755 /run/php

# Substitutes the conf file to listen to port 9000
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]