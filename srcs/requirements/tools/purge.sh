#!/bin/bash

#COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

docker container rm -f $(docker container ps -aq | grep -v c12e78acfe32) 2> /dev/null
docker image rmi -f $(docker image ls -qa | grep -v ceccf204404e) 2> /dev/null
docker volume rm -f $(docker volume ls -q) 2> /dev/null
docker network rm $(docker network ls -q) 2> /dev/null
sudo rm -rf $VOLUME_DIR 2> /dev/null
sed -i "s|export LOGIN_FROM_ENV="$LOGIN_FROM_ENV"||g" ~/.bashrc
sed -i "s|export VOLUME_DIR="$VOLUME_DIR"||g" ~/.bashrc
echo $GREEN"clean done"$NC
