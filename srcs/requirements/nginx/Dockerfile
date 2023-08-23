FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install nginx openssl -y

RUN openssl req -x509 -nodes -days 365 \
	-subj  "/C=CA/ST=QC/O=Company Inc/CN=example.com" \
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/

RUN rm  /etc/nginx/sites-enabled/default && mv  /etc/nginx/sites-enabled/nginx.conf  /etc/nginx/sites-enabled/default.conf

#RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/

EXPOSE 443

RUN nginx -t

CMD ["nginx", "-g", "daemon off;"]
