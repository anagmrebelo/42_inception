FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y vsftpd
RUN apt-get install -y vim netcat

COPY ./conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/start_ftp.sh /tmp/start_ftp.sh
RUN chmod +x /tmp/start_ftp.sh

RUN mkdir -p /var/run/vsftpd/empty

#ENTRYPOINT ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
#CMD ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/tmp/start_ftp.sh"]