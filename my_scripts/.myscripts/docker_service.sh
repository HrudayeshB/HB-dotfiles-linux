#!/bin/bash

if [ "$1" == "on" ]; then
    systemctl start docker
    echo "Docker service started"
elif [ "$1" == "off" ]; then
    systemctl stop docker
    echo "Docker service stopped"
else
    echo "Usage: nl [on|off]"
fi
