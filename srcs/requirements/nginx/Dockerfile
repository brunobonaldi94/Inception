FROM debian:bullseye

ARG LOGIN

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install nginx openssl -y

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
            -out /etc/ssl/certs/nginx-selfsigned.crt \
            -keyout /etc/ssl/private/nginx-selfsigned.key \
            -subj "/C=BR/ST=SaoPaulo/L=SaoPaulo/O=42SP/OU=$LOGIN/CN=$LOGIN.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
