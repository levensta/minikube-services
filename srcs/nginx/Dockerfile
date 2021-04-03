FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add nginx bash openssl

EXPOSE 80 443

COPY ./src/* /server/

CMD bash /server/script.sh

# docker build -t nginx_image .
# docker run -it -p 80:80 -p 443:443 --name nginx_container --rm nginx_image