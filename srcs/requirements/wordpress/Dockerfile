FROM debian:bullseye

ARG WORDPRESS_DB_HOST
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WORDPRESS_TITLE
ARG WORDPRESS_URL
ARG LOGIN
ARG WORDPRESS_EMAIL
ARG WORDPRESS_ADMIN_EMAIL

RUN apt-get -y update && apt-get -y upgrade

RUN apt install php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml php-gd php-curl wget -y

WORKDIR /var/www/html/

RUN sed -i.default "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
    /etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xf latest.tar.gz && mv wordpress/* . && rm -rf latest.tar.gz

RUN mv wp-config-sample.php wp-config.php && \
    sed -i "s/database_name_here/${MYSQL_DATABASE}/g" wp-config.php && \
    sed -i "s/username_here/${MYSQL_USER}/g" wp-config.php && \
    sed -i "s/password_here/${MYSQL_PASSWORD}/g" wp-config.php && \
	sed -i "s/localhost/${WORDPRESS_DB_HOST}/g" wp-config.php

RUN mkdir -p /run/php/

RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup_wp.sh ./

RUN chmod +x setup_wp.sh 

EXPOSE 9000

CMD ["./setup_wp.sh"]
