FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash mysql mysql-client openrc

EXPOSE 3306

COPY ./src/* /server/

VOLUME [ "/var/lib/mysql" ]
VOLUME [ "/sys/fs/cgroup" ]

CMD bash /server/script.sh

# docker build -t mysql_image ./srcs/mysql/
# docker run -it -p 80:80 -p 443:443 --name mysql_container --rm mysql_image
# --no-cache ??
# --allow-untrusted ??