FROM debian:11

RUN apt update -y

RUN apt install nginx php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml php-gd php-curl mariadb-server wget -y

RUN service nginx start && service mariadb start

RUN update-rc.d nginx defaults && \
    update-rc.d mariadb defaults

#mariadb

COPY ./configure_database.sh .

RUN chmod +x ./configure_database.sh

RUN service mariadb start && ./configure_database.sh

#Install And Configure The WordPress

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xf latest.tar.gz

WORKDIR  /var/www/html/wordpress

RUN mv wp-config-sample.php wp-config.php

RUN sed -i 's/database_name_here/wp_db/g' wp-config.php

RUN sed -i 's/username_here/wp_user/g' wp-config.php

RUN sed -i 's/password_here/123456/g' wp-config.php

RUN chown -R www-data:www-data /var/www/html/wordpress

RUN chmod -R 755 /var/www/html/wordpress

#ngnix

WORKDIR /etc/nginx/sites-available/

COPY ./wordpress.conf .

RUN rm default

WORKDIR /etc/nginx/sites-enabled/

RUN rm default

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

RUN mkdir -p /run/php/
RUN touch /run/php/php7.4-fpm.sock
RUN chown www-data:www-data /run/php/php7.4-fpm.sock
RUN chmod 0660 /run/php/php7.4-fpm.sock

RUN nginx -t

RUN service nginx restart

CMD service php7.4-fpm start && service mariadb start && nginx -g "daemon off;"

