FROM debian:11

ARG MYSQL_HOST
ARG	MYSQL_DATABASE
ARG	MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt update -y

RUN apt install php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml php-gd php-curl wget -y

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xf latest.tar.gz

WORKDIR  /var/www/html/wordpress

RUN mv wp-config-sample.php wp-config.php

RUN sed -i 's/database_name_here/${MYSQL_DATABASE}/g' wp-config.php

RUN sed -i 's/username_here/${MYSQL_USER}/g' wp-config.php

RUN sed -i 's/password_here/${MYSQL_PASSWORD}/g' wp-config.php

RUN chown -R www-data:www-data /var/www/html/wordpress

RUN chmod -R 755 /var/www/html/wordpress

#RUN mkdir -p /run/php/ && \
#    touch /run/php/php7.4-fpm.sock && \
#    chown www-data:www-data /run/php/php7.4-fpm.sock && \
#    chmod 0660 /run/php/php7.4-fpm.sock

EXPOSE 9000

CMD ["php7.4-fpm"]

