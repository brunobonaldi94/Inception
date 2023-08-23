FROM debian:bullseye

ARG MYSQL_HOST
ARG	MYSQL_DATABASE
ARG	MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get -y update

RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./conf/configure_database.sh .

RUN chmod +x ./configure_database.sh

RUN service mariadb start && ./configure_database.sh

EXPOSE 3306

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]