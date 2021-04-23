FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash wget

EXPOSE 3000

COPY ./src/* /server/
ADD https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz /

CMD bash /server/script.sh

# docker build -t grafana_image ./srcs/grafana/
# docker run -it -p 3000:3000 --name grafana_container --rm grafana_image
# kubectl cp grafana-deployment-6ccdf5bbbf-bk6mv:/grafana-7.5.4/data/grafana.db grafana.db