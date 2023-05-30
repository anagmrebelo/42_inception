FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget php php7.3-fpm php7.3-mysqli mariadb-client
RUN apt-get install -y vim netcat wget

# JUST TESTING
# COPY ./index.html /var/www/html/
COPY ./phpinfo.php /var/www/html/

#PHP SETUP
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html/

# Download Adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
# Rename the downloaded file to index.php so it's served as the default page
RUN mv adminer-4.8.1.php index.php

RUN mkdir -p /run/php
RUN chmod 755 /run/php
EXPOSE 9000
#ENTRYPOINT
ENTRYPOINT [ "/usr/sbin/php-fpm7.3", "-F" ]

