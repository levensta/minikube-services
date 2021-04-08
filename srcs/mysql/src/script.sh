mv /server/my.cnf /etc/mysql/
chmod 744 /etc/mysql/my.cnf

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -e "CREATE USER 'root'@'%';" -u root --skip-password
mysql -e "CREATE DATABASE wordpress;" -u root --skip-password
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';" -u root --skip-password
# mysql -e "update mysql.user set plugin='mysql_native_password' where user='root';" -u root --skip-password
mysql -e "FLUSH PRIVILEGES;" -u root

mysql wordpress -u root < /server/wordpress.sql
rc-service mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
# bash