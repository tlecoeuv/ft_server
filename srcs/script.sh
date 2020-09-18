#!/bin/bash

service nginx start
service mysql start
service php7.3-fpm start

wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
mv /wordpress /var/www/
chown -R www-data: /var/www/wordpress

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
tar -xf phpMyAdmin-4.9.0.1-english.tar.gz
mv /phpMyAdmin-4.9.0.1-english /var/www/phpmyadmin
chown -R www-data: /var/www/phpmyadmin

rm /etc/nginx/sites-enabled/default

if [ $INDEX == 0 ]
then
	cp srcs_docker/nginxblock_off /etc/nginx/sites-available/default
else
	cp srcs_docker/nginxblock_on /etc/nginx/sites-available/default
fi
ln -s /etc/nginx/sites-available/default  /etc/nginx/sites-enabled/default

mysql < srcs_docker/mdb_script.sql

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

service nginx restart
/bin/bash
