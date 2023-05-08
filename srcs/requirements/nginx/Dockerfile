FROM debian:bullseye

# Install nginx and openssl
RUN apt-get update
RUN apt-get install nginx openssl --no-install-recommends --no-install-suggests -y

# Copy configuration file
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Set SSL
RUN openssl req -new -newkey\
	# type of public-key cryptography
	rsa:2048\
	# self-signed certificate
	-x509\
	# type of encryptions
	-sha256\
	# renewal period
	-days 365\
	# Avoids password requirement
	-nodes\
	-keyout /etc/ssl/arebelo.key\
	-out /etc/ssl/arebelo.csr\
	-subj "/C=ES/ST=Barcelona/L=Barcelona/O=42/CN=arebelo"

RUN cat /etc/ssl/arebelo.csr /etc/ssl/arebelo.key > /etc/ssl/arebelo.pem

# Connection port
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]