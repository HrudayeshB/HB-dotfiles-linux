#!/bin/bash

if [ "$1" == "on" ]; then
    gnome-extensions enable forge@jmmaranan.com
    echo "Tiling will be available"
elif [ "$1" == "off" ]; then
    gnome-extensions disable forge@jmmaranan.com
    echo "Tiling will not be availabe"
else
    echo "Usage: forge [on|off]"
fi

