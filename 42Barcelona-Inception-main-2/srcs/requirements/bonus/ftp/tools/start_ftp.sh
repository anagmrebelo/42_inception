#!/bin/bash
if [ ! -f "/etc/vsftpd.conf.bak" ]; then

	echo "FTP setting up"
    mkdir -p /var/www/html

    cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
    mv /tmp/vsftpd.conf /etc/vsftpd.conf

    # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
    adduser $FTP_USER --disabled-password
    echo "$FTP_USER:$FTP_PASSWORD"
    echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
    chown -R $FTP_USER:$FTP_USR /var/www/html

	#chmod +x /etc/vsftpd/vsftpd.conf
    echo $FTP_USER | tee -a /etc/vsftpd.userlist
else
	echo "FTP already configured"
fi
echo "FTP started on :21"
vsftpd /etc/vsftpd.conf
#tail -f /dev/null