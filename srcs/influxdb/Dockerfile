FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash wget supervisor

EXPOSE 8086

COPY ./src/* /server/
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.18.1_linux_amd64.tar.gz /server/

VOLUME [ "/root/.influxdb" ]

CMD bash /server/script.sh

# docker build -t influxdb_image ./srcs/influxdb/
# docker run -it -p 8086:8086 --name influxdb_container --rm influxdb_image