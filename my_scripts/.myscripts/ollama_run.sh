#!/bin/bash

if [ "$1" == "on" ]; then
    systemctl start ollama
    echo "olama_serv Started"
elif [ "$1" == "off" ]; then
    systemctl stop ollama
    echo "olama_serv stopped"
else
    echo "Usage: olama_serv [on|off]"
fi
