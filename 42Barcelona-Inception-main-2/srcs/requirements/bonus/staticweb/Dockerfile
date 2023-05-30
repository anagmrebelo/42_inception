FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN	apt-get install -y nginx 
RUN	apt-get install -y vim netcat
#RUN	apt-get install -y systemctl
#RUN apt-get install -y certbot python3-certbot-nginx

WORKDIR /var/www/html
COPY ./conf/nginx.conf /etc/nginx/conf.d/my_nginx.conf
COPY ./files /var/www/html/

RUN mkdir -p /run/nginx
EXPOSE 80
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
