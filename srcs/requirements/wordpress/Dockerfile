FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install php\
	libapache2-mod-php\
	php-pear\
	php-cgi\
	php-common\
	php-mbstring\
	php-zip\
	php-net-socket\
	php-gd\
	php-xml-util\
	php-mysql\
	php-bcmath\
	unzip\
	wget\
	git\
	-y

EXPOSE 9000