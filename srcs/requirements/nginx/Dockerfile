FROM debian:11

RUN apt-get -y update

RUN apt-get install nginx openssl -y

RUN openssl req -x509 -nodes -days 365 \
	-subj  "/C=CA/ST=QC/O=Company Inc/CN=example.com" \
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

WORKDIR /etc/nginx/sites-available/

COPY ./conf/nginx.conf .

RUN rm default

WORKDIR /etc/nginx/sites-enabled/

RUN rm default

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 80

RUN nginx -t

RUN service nginx restart

CMD ["nginx", "-g", "daemon off;"]
