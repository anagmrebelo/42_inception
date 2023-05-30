FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget php php7.3-fpm php7.3-mysqli mariadb-client
RUN apt-get install -y vim netcat

# JUST TESTING
# COPY ./index.html /var/www/html/
COPY ./phpinfo.php /var/www/html/

#PHP SETUP
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#WP CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#WP SETUP SCRIPT
COPY ./tools/wp_setup.sh /usr/local/bin/wp_setup.sh
RUN chmod +x /usr/local/bin/wp_setup.sh

WORKDIR /var/www/html/
RUN mkdir -p /run/php
RUN chmod 755 /run/php
EXPOSE 9000
#ENTRYPOINT
ENTRYPOINT [ "/usr/local/bin/wp_setup.sh" ]
