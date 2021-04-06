# cd server
# wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
# tar -xzf phpMyAdmin-4.9.7-all-languages.tar.gz -C /var/www/
# rm -rf phpMyAdmin-4.9.7-all-languages.tar.gz latest.tar.gz

# mv /var/www/phpMyAdmin-4.9.7-all-languages /var/www/phpmyadmin/
# mv /server/config.inc.php /var/www/phpmyadmin

# # chmod 660 /var/www/phpmyadmin/config.inc.php
# chmod 777 -R /var/www/*
# ln -s /var/www/phpmyadmin/ /server/phpmyadmin
# echo "[ ok ] phpMyAdmin succesfully installed"

mkdir -p /run/nginx
mkdir -p /run/php
mkdir -p /var/log/supervisor

rm /etc/nginx/conf.d/*
mv /server/my_nginx.conf /etc/nginx/conf.d/

# chmod -R 755 /var/www/*
# wget https://files.phpmyadmin.net/phpMyAdmin/5.0.3/phpMyAdmin-5.0.3-all-languages.tar.gz
# tar -xzf phpMyAdmin-5.0.3-all-languages.tar.gz
# rm -rf phpMyAdmin-5.0.3-all-languages.tar.gz
# mv phpMyAdmin-5.0.3-all-languages/ /var/www/phpmyadmin
# mv /server/config.inc.php /var/www/phpmyadmin/
# mv /server/supervisord.conf /etc/supervisord.conf

bash

# nginx -g 'daemon off;'
# php-fpm7 -R -F