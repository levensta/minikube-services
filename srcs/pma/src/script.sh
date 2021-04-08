mkdir -p /run/nginx
mkdir -p /run/php
mkdir -p /var/log/supervisor

# rm /etc/nginx/conf.d/*
mv /server/pma_nginx.conf /etc/nginx/conf.d/

chmod -R 744 /var/www/*
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.3/phpMyAdmin-5.0.3-all-languages.tar.gz
tar -xzf phpMyAdmin-5.0.3-all-languages.tar.gz
rm -rf phpMyAdmin-5.0.3-all-languages.tar.gz
mv phpMyAdmin-5.0.3-all-languages/ /var/www/phpmyadmin
mv /server/config.inc.php /var/www/phpmyadmin/
echo "[ ok ] phpMyAdmin succesfully installed"

mv /server/supervisord.conf /etc/supervisord.conf

# bash

# nginx -g 'daemon off;'
# php-fpm7 -R -F