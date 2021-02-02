#!/bin/sh
service mysql start
echo "CREATE DATABASE localhost;" | mysql
echo "GRANT ALL ON localhost.* TO 'test'@'localhost' IDENTIFIED BY 'test' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql
service nginx restart
service mysql restart
service php7.3-fpm start
sleep 10000
