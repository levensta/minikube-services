FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash nginx wget supervisor php7 php7-fpm php7-mysqli php7-zip php7-gd \
php7-mbstring php7-cli php7-opcache php7-zlib php7-curl php7-json php7-iconv php7-gettext php7-session php7-phar

EXPOSE 5000
COPY ./src/* /server/
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.3/phpMyAdmin-5.0.3-all-languages.tar.gz /

CMD bash /server/script.sh

# docker build -t pma_image ./srcs/pma/
# docker run -it -p 5000:5000 --name pma_container --rm pma_image