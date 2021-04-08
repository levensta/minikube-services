mkdir -p /run/nginx
mkdir -p /run/php
mkdir -p /var/log/supervisor

chmod -R 744 /var/www/*
mv /server/wp_nginx.conf /etc/nginx/conf.d/
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz -C /var/www/
mv /server/wp-config.php /var/www/wordpress/

mv /server/supervisord.conf /etc/supervisord.conf