FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx mariadb mariadb-client mariadb-server-utils

COPY ./conf/init.sh /init.sh

# Customize the rest of your Dockerfile as needed

EXPOSE $MDB_PORT

CMD ["sh", "/init.sh"]