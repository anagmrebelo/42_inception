FROM debian:bullseye

# Install mariadb
RUN apt-get update -y
RUN apt-get install -y mariadb-server

# Create necessary folders with permissions
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /run/mysqld/
RUN chmod -R 075 /run/mysqld/

# Configuration file
COPY ./conf/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Run mariadb start script
COPY ./tools/mariadb_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb_start.sh

# Expose portss
EXPOSE 3306

#ENTRYPOINT [ "/usr/local/bin/mariadb_start.sh" ]
CMD ["tail" ,"-f", "/dev/null"]
