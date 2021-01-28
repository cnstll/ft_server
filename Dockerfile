FROM debian:buster
RUN apt-get update -yq \
&& apt-get install nginx openssl -y \
&& apt-get install php7.3 php-mysql php7.3-fpm\
&& apt-get install -y mariadb-server mariadb-client

EXPOSE 80

