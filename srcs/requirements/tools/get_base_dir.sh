#!/bin/bash

ENV_FILE="$PWD"/srcs/.env
LOGIN_FROM_ENV=$(grep "LOGIN=" $ENV_FILE | cut -d '=' -f2)
VOLUME_DIR=/home/${LOGIN_FROM_ENV}/data

check_existence_of_variable() {
	VAR_NAME="$1"
	FILE="$2"
	ARG_VALUE=$(grep "$1=" $2 | cut -d '=' -f2)
	if [ -z "$ARG_VALUE" ]; then
		echo "${RED}Please add $VAR_NAME in $2 file ${RESET}"
		exit 1
	fi
}

check_existence_of_variable "LOGIN" $ENV_FILE

sudo echo "export LOGIN_FROM_ENV="$LOGIN_FROM_ENV"" >> ~/.bashrc
sudo echo "export VOLUME_DIR="$VOLUME_DIR"" >> ~/.bashrc 

source ~/.bashrc 
