#!/bin/bash

#COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/get_base_dir.sh

docker container rm -f $(docker container ps -aq | grep -v c12e78acfe32) 2> /dev/null
docker image rmi -f $(docker image ls -qa | grep -v ceccf204404e) 2> /dev/null
docker volume rm -f $(docker volume ls -q) 2> /dev/null
docker network rm $(docker network ls -q) 2> /dev/null
sudo -E rm -rf $VOLUME_DIR 
sed -i '/export LOGIN_FROM_ENV=/d' ~/.bashrc
sed -i '/export VOLUME_DIR=/d' ~/.bashrc
echo -e $GREEN"clean done"$NC
