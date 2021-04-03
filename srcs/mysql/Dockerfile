FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash mysql mysql-client

EXPOSE 3306

COPY ./src/* /server/

CMD bash /server/script.sh

# docker build -t mysql_image .
# docker run -it -p 80:80 -p 443:443 --name mysql_container --rm mysql_image