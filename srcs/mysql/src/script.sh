service mysql start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "GRANT ALL ON wordpress.* TO 'root'@'localhost';"
mysql -e "update mysql.user set plugin='mysql_native_password' where user='root';"
mysql -e "FLUSH PRIVILEGES;"

bash