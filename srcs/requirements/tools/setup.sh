#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m' # Reset color

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/get_base_dir.sh

echo $LOGIN_FROM_ENV
echo $VOLUME_DIR

# Variables
ENV_FILE="$PWD"/srcs/.env
ENV_ARGS=$(cat << EOF 
LOGIN VOLUME_DIR WORDPRESS_LOCAL_HOME WORDPRESS_UPLOADS_CONFIG 
WORDPRESS_DB_HOST WORDPRESS_TITLE WORDPRESS_URL 
WORDPRESS_EMAIL WORDPRESS_ADMIN_EMAIL MYSQL_HOST 
MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD
EOF
)

get_arg_value() {
	VALUE=$(grep "$1=" $2 | cut -d '=' -f2)
	echo $VALUE
}

replace_login_dummy () {
	FILE="$1"
	sed -i "s|$LOGIN_TO_CHANGE|$LOGIN_FROM_ENV|g" $FILE
}

check_existence_of_variable() {
	VAR_NAME="$1"
	FILE="$2"
	ARG_VALUE=$(get_arg_value $VAR_NAME $FILE)
	if [ -z "$ARG_VALUE" ]; then
		echo -e "${RED}Please add $VAR_NAME in $2 file ${RESET}"
		exit 1 
	fi
}

create_env_file() {
	if [ -f $ENV_FILE ]; then
		replace_login_dummy $ENV_FILE
		for VAR in $ENV_ARGS; do
			check_existence_of_variable $VAR $ENV_FILE
		done
	else
		touch $ENV_FILE
		for VAR in $ENV_ARGS; do
			echo "$VAR=" >> $ENV_FILE
		done
		echo "${GREEN}File $ENV_FILE created!${RESET}"
	fi
}

create_volumes_dir() {
	if [ -d "$VOLUME_DIR/wordpress" ] && [ -d "$VOLUME_DIR/mariadb" ] && [ -d "$VOLUME_DIR/nginx" ]; then
		echo "Folder $VOLUME_DIR already exists"
	else
		sudo -E mkdir -p $VOLUME_DIR/wordpress
		sudo -E mkdir -p $VOLUME_DIR/mariadb 
		sudo -E mkdir -p $VOLUME_DIR/nginx
		echo "Folder $VOLUME_DIR created"
	fi
}

replace_login_nginx_conf() {
	NGINX_CONF="$PWD"/srcs/requirements/nginx/conf/nginx.conf
	replace_login_dummy $NGINX_CONF
}

create_env_file
create_volumes_dir
replace_login_nginx_conf
grep $LOGIN_FROM_ENV.42.fr /etc/hosts || echo "127.0.0.1 $LOGIN_FROM_ENV.42.fr" | sudo tee --append /etc/hosts


