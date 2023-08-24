#!/bin/bash

wp core install  \
	--url=${WORDPRESS_URL}  \
	--title=${WORDPRESS_TITLE}  \
	--admin_user=${MYSQL_USER}  \
	--admin_password=${MYSQL_PASSWORD}  \
	--admin_email=$WORDPRESS_ADMIN_EMAIL \
	--skip-email --allow-root

wp user create ${LOGIN} $WORDPRESS_EMAIL --user_pass=$MYSQL_PASSWORD --role=subscriber --porcelain --allow-root

php-fpm -F
