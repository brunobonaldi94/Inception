FROM debian:11

ARG WORDPRESS_DB_HOST
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_NAME

RUN apt update -y

RUN apt install php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml php-gd php-curl wget -y

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xf latest.tar.gz

WORKDIR  /var/www/html/wordpress

RUN mv wp-config-sample.php wp-config.php && \
    sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/g" wp-config.php && \
    sed -i "s/username_here/${WORDPRESS_DB_USER}/g" wp-config.php && \
    sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/g" wp-config.php && \
	sed -i "s/localhost/${WORDPRESS_DB_HOST}/g" wp-config.php && \
    chown -R www-data:www-data /var/www/html/wordpress && \
    chmod -R 755 /var/www/html/wordpress

RUN rm -rf /run/php/

RUN mkdir -p /run/php/

RUN touch /run/php/php7.4-fpm.sock && \
    chown www-data:www-data /run/php/php7.4-fpm.sock && \
    chmod 0660 /run/php/php7.4-fpm.sock

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
