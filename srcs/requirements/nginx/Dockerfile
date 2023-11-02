FROM    alpine:3.16

WORKDIR /var/www/html

RUN     apk update && apk upgrade && apk add --no-cache nginx gettext

COPY    ./conf/default.template /etc/nginx/http.d/default.template

COPY    ./conf/entrypoint.sh /entrypoint.sh
RUN     chmod +x /entrypoint.sh

EXPOSE  $NGINX_PORT

CMD     ["sh", "/entrypoint.sh"]