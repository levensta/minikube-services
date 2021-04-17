FROM alpine:3.12
LABEL info="by levensta for services"
RUN apk update && apk upgrade && apk add bash vsftpd openssl

EXPOSE 21

COPY ./src/* /server/

CMD bash /server/script.sh

# docker build -t ftps_image ./srcs/ftps/
# docker run -it -p 21:21 --name ftps_container --rm ftps_image