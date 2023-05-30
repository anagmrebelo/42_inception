#//////////////////////////////////////////////////////////////////////#
#	_Dockerfile:nginx                                                  #
#//////////////////////////////////////////////////////////////////////#

FROM debian:10.11

RUN apt-get update && \
	apt-get -y install nginx \
	openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/smiro.crt \
	-keyout /etc/nginx/ssl/smiro.key \
	-subj "/C=ES/ST=Barcelona/L=Barcelona/O=42 School/OU=smiro/CN=smiro/"

COPY conf/nginx.conf /etc/nginx/conf.d/

RUN mkdir -p /run/nginx

CMD ["nginx", "-g", "daemon off;"]
