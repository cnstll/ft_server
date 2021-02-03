#!/bin/sh

if [ $autoindex = "off" ]
then
    echo sed -i '19,19 s/^/#/' /etc/nginx/sites-available/default
fi

# Creating SSL Certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=localhost"

# Creating DB with test User
service mysql start
echo "CREATE DATABASE localhost;" | mysql
echo "GRANT ALL ON localhost.* TO 'test'@'localhost' IDENTIFIED BY 'test' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql


# Init services
service nginx restart
service mysql restart
service php7.3-fpm start
sleep 10000

