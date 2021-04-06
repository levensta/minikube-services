mv /server/my.cnf /etc/mysql/
chmod 777 /etc/mysql/my.cnf

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mariadb -e "CREATE DATABASE wordpress;" -u root --skip-password
mariadb -e "CREATE USER 'root'@'%';" -u root --skip-password
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;" -u root --skip-password
# mariadb -e "update mysql.user set plugin='mysql_native_password' where user='root';" -u root --skip-password
mariadb -e "FLUSH PRIVILEGES;" -u root

mysqld_safe --data='/var/lib/mysql'