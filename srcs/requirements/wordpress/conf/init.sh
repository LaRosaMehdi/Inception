#!/bin/bash

envsubst '${WP_PHP_USER} ${WP_PHP_GROUP} ${WP_PHP_LISTEN_OWNER} ${WP_PHP_LISTEN_GROUP}' < ./www.conf.template > ./www.conf
chmod 777 /var/www/html
ls /var/www/html
wp core download --allow-root --path="/var/www/html"
rm -f /var/www/html/wp-config.php7
rm -f /etc/php7/php-fpm.d/www.conf
cp ./wp-config.php /var/www/html/wp-config.php
cp ./www.conf /etc/php7/php-fpm.d/www.conf
wp core install --url=${DOMAIN_NAME} --title="Inception" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --path="/var/www/html" --allow-root --skip-email
wp --allow-root user create ${MDB_USER} ${WP_USER_EMAIL} --role="author" --user_pass=${MDB_USER_PWD}  --path="/var/www/html"
$@