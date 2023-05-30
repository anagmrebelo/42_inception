# userdel mysql
# useradd -u 999 mysql
# chown -R mysql:mysql /var/lib/mysql

service mysql start
echo $MYSQL_DATABASE > log.txt
mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
mysql -u root -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"




