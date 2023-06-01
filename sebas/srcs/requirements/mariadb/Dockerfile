#//////////////////////////////////////////////////////////////////////#
#	_Dockerfile:mariadb                                                #
#//////////////////////////////////////////////////////////////////////#

FROM debian:10.11

RUN apt-get update && \
	apt-get install -y \
	mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld \
	&& chmod 777 /run/mysqld

EXPOSE 3306

COPY tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

RUN mysql_install_db

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]
