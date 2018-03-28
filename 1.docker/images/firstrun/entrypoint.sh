#!/bin/sh
echo "#####################"
echo ENVIRONMENT VARIABLES
env
echo "#####################"

trap 'echo "SIGINT RECEIVED";exit 0' SIGINT
trap 'echo "SIGTERM RECEIVED";exit 0' SIGTERM
trap 'echo "SIGQUIT RECEIVED";exit 0' SIGQUIT


if [ $NCPORT ]; then

        nc -lv $NCPORT
	echo "Netcat listening on port $NCPORT"
fi

while true; do 
  echo "Congrats! your first container is running" && sleep 1 
done
