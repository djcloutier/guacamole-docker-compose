#!/bin/sh
#
# check for root privilege
if [ "$(id -u)" != "0" ]; then
   echo " this script must be run as root...elevating to root"
   echo
   sudo "$0" "$@"
   exit $?
fi

# check if docker is running
if ! (docker ps >/dev/null 2>&1)
then
	echo "docker daemon not running, will exit here!"
	exit
fi
prepare.sh
docker-compose up -d