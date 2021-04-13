FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash wget supervisor

EXPOSE 8086

COPY ./src/* /server/

VOLUME [ "/var/lib/influxdb" ]
# VOLUME [ "/sys/fs/cgroup" ]

RUN bash /server/script.sh
CMD ["/usr/bin/supervisord"]

# docker build -t influxdb_image ./srcs/influxdb/
# docker run -it -p 8086:8086 --name influxdb_container --rm influxdb_image