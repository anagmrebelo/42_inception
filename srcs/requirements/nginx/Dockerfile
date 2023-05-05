FROM debian:bullseye

# Install nginx and openssl
RUN apt-get update
RUN apt-get install nginx openssl --no-install-recommends --no-install-suggests -y

COPY ./conf/nginx.conf /etc/nginx/conf.d

# Connection port
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]