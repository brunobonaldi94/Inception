#!/bin/bash


# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m' # Reset color

# Variables
ENV_FILE="$PWD"/srcs/.env
ENV_ARGS="WORDPRESS_DB_HOST MYSQL_HOST MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD LOGIN"

check_existence_of_variable() {
	VAR_NAME="$1"
	FILE="$2"
	ARG_VALUE=$(grep "$1=" $2 | cut -d '=' -f2)
	if [ -z "$ARG_VALUE" ]; then
		echo "${RED}Please add $VAR_NAME in $2 file ${RESET}"
		exit 1
	fi
}

create_env_file() {
	if [ -f $ENV_FILE ]; then
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
	if [ -d "$VOLUME_DIR/wordpress" ] && [ -d "$VOLUME_DIR/mariadb" ]; then
		echo "Folder $VOLUME_DIR already exists"
	else
		sudo mkdir -p $VOLUME_DIR/wordpress
		sudo mkdir -p $VOLUME_DIR/mariadb 
		echo "Folder $VOLUME_DIR created"
	fi
}

create_env_file
create_volumes_dir
