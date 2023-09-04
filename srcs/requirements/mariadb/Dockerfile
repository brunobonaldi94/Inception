FROM debian:bullseye

ARG MYSQL_HOST
ARG	MYSQL_DATABASE
ARG	MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y mariadb-server wget dumb-init

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./conf/configure_database.sh .

RUN chmod +x ./configure_database.sh

RUN service mariadb start && ./configure_database.sh

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld_safe"]
