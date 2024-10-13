#!/bin/bash

if [ "$1" == "on" ]; then
    systemctl start ollama
    echo "Ollama Started"
elif [ "$1" == "off" ]; then
    systemctl stop ollama
    echo "Ollama stopped"
else
    echo "Usage: nl [on|off]"
fi
