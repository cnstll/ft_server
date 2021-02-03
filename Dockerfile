FROM debian:buster


RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y wget \
&& apt-get install -y nginx \
&& apt-get install -y openssl \
&& apt-get install -y php7.3 php-mysql php7.3-fpm \
&& apt-get install -y mariadb-server mariadb-client 

RUN mkdir /var/www/localhost \
&& wget -cO wordpress.tar.gz https://wordpress.org/latest.tar.gz \
&& tar -xzvf wordpress.tar.gz \
&& rm -rf wordpress.tar.gz \
&& mv /wordpress /var/www/localhost/ \
&& wget -cO phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz \
&& tar -xzvf phpmyadmin.tar.gz \
&& rm -rf phpmyadmin.tar.gz \
&& mv /phpMyAdmin-4.9.7-all-languages /phpmyadmin \
&& mv /phpmyadmin /var/www/localhost/ 

COPY srcs/wp-config.php /var/www/localhost/wordpress/
COPY srcs/config.inc.php /var/www/localhost/phpmyadmin/
COPY srcs/info.php /var/www/localhost/phpmyadmin/
COPY srcs/default /etc/nginx/sites-available
COPY srcs/self-signed.conf /etc/nginx/snippets/
COPY srcs/ssl-params.conf /etc/nginx/snippets/
COPY srcs/script.sh ./

RUN chown -R www-data /var/www/localhost \
&& chmod -R 765  /var/www/localhost

EXPOSE 80
EXPOSE 443

CMD bash script.sh
