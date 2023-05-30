FROM debian:buster

# Install mariadb
RUN apt-get update -y
RUN apt-get install -y mariadb-server

# Create necessary folders with permissions
# RUN mkdir -p /var/run/mysqld
# RUN chown -R mysql:mysql /run/mysqld/
# RUN chmod -R 075 /run/mysqld/

# Configuration file
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Run mariadb start script
COPY ./tools/mariadb_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb_start.sh
RUN /usr/local/bin/mariadb_start.sh
#RUN mysql_install_db

# Expose portss
EXPOSE 3306

# ENTRYPOINT [ "/usr/local/bin/mariadb_start.sh" ]

CMD ["mysqld"]
#CMD ["tail" ,"-f", "/dev/null"]
