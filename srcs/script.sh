#!/bin/sh
#service mysql start
#echo "CREATE DATABASE example_database;" | mysql
#echo "GRANT ALL ON example_database.* TO 'calle'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;" | mysql
#echo "FLUSH PRIVILEGES;" | mysql
service nginx start
service mysql start
service php7.3-fpm
sleep 300
