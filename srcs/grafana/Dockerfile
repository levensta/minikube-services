FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash wget

EXPOSE 3000

COPY ./src/* /server/


CMD bash /server/script.sh

# docker build -t grafana_image ./srcs/grafana/
# docker run -it -p 3000:3000 --name grafana_container --rm grafana_image