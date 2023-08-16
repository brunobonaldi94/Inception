#!/bin/bash

mysql -u root -p"${MYSQL_PASSWORD}" << EOF
CREATE DATABASE wp_db;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL ON wp_db.* TO 'wp_user'@'localhost';
FLUSH PRIVILEGES;
EOF