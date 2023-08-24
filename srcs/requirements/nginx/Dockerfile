FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install nginx openssl -y

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
