FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add nginx bash openssl
#
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN apk add php7-json php7-iconv php7-mbstring php7-gettext php7-session php7-phar 

EXPOSE 80 443

COPY ./src/* /server/

CMD bash /server/script.sh

# docker build -t nginx_image ./srcs/nginx/
# docker run -it -p 80:80 -p 443:443 --name nginx_container --rm nginx_image