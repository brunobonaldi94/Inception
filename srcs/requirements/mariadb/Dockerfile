FROM debian:11

ARG MYSQL_PASSWORD

RUN apt-get -y update

RUN apt-get install -y mariadb-server

COPY ./conf/configure_database.sh .

RUN chmod +x ./configure_database.sh

RUN service mariadb start && ./configure_database.sh

EXPOSE 3306

CMD ["mariadbd"]