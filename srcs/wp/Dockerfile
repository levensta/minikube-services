FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash nginx wget supervisor php7 php7-fpm php7-mysqli php7-zip php7-gd \
php7-mbstring php7-cli php7-opcache php7-zlib php7-curl php7-json php7-iconv php7-gettext php7-session php7-phar

EXPOSE 5050

COPY ./src/* /server/

CMD bash /server/script.sh

# docker build -t wp_image ./srcs/wp/
# docker run -it -p 5000:5000 --name wp_container --rm wp_image