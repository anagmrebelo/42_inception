FROM debian:buster

# Install mariadb
RUN apt-get update -y
RUN apt-get install -y mariadb-server

# Configuration file
COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Run mariadb start script
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD
COPY ./tools/mariadb_start.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/mariadb_start.sh
RUN /usr/local/bin/mariadb_start.sh
# RUN mysql_install_db

# Expose ports
EXPOSE 3306

# ENTRYPOINT [ "/usr/local/bin/mariadb_start.sh" ]

CMD ["mysqld"]
#CMD ["tail" ,"-f", "/dev/null"]
