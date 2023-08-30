#!/bin/bash

ENV_FILE="$PWD"/srcs/.env
LOGIN_FROM_ENV=$(grep "LOGIN=" $ENV_FILE | cut -d '=' -f2)
VOLUME_DIR=/home/${LOGIN_FROM_ENV}/data
LOGIN_TO_CHANGE="__LOGIN_TO_CHANGE__"

check_existence_of_variable() {
	VAR_NAME="$1"
	FILE="$2"
	ARG_VALUE=$(grep "$1=" $2 | cut -d '=' -f2)
	if [ -z "$ARG_VALUE" ]; then
		echo -e "${RED}Please add $VAR_NAME in $2 file ${RESET}"
		exit 1
	elif [[ $ARG_VALUE == *$LOGIN_TO_CHANGE* ]]; then
		echo -e "${RED}Please add valid $VAR_NAME name in $2 file ${RESET}"
		exit 1
	fi
}

check_existence_of_variable "LOGIN" $ENV_FILE

export LOGIN_FROM_ENV="$LOGIN_FROM_ENV"
export VOLUME_DIR="$VOLUME_DIR"
export LOGIN_TO_CHANGE="$LOGIN_TO_CHANGE"

