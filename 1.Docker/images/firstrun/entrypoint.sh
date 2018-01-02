#!/bin/sh

env

if [ $NCPORT ]; then

        nc -lv $NCPORT
	echo "Netcat listening on port $NCPORT"
fi

while true; do echo "Congrats! your first container is running" && sleep 1 ; done
