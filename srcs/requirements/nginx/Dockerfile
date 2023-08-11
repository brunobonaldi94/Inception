FROM debian:11

RUN apt-get -y update

RUN mkdir /ngnix

RUN apt-get install -y ngnix

EXPOSE 443

CMD ["systemctl", "start", "ngnix"]

