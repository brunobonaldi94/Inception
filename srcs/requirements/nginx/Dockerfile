FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install nginx openssl -y

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
            -out /etc/nginx/ssl/nginx-selfsigned.crt \
            -keyout /etc/nginx/ssl/nginx-selfsigned.key \
            -subj "/C=FR/L=Paris/O=42School/CN=bbonaldi.42.fr/"

RUN chmod 777 /etc/nginx/ssl/*

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
