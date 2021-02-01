FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y wget \
&& apt-get install -y nginx \
&& apt-get install -y openssl \
&& apt-get install -y php7.3 php-mysql php7.3-fpm \
&& apt-get install -y mariadb-server mariadb-client \
&& wget -cO wordpress.tar.gz https://wordpress.org/latest.tar.gz \
&& tar -xzvf wordpress.tar.gz \
&& rm -rf wordpress.tar.gz \
&& wget -cO phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz \
&& tar -xzvf phpmyadmin.tar.gz \
&& rm -rf phpmyadmin.tar.gz

# COPY srcs/wp-config.php /wordpress
# COPY srcs/config.inc.php /phpmyadmin
# COPY srcs/info.php phpmyadmin
# COPY srcs/server_block /etc/nginx/sites-available 

EXPOSE 80
EXPOSE 443

