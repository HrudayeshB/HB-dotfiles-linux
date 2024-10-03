#!/bin/bash

if [ "$1" == "on" ]; then
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    echo "Night Light enabled"
elif [ "$1" == "off" ]; then
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
    echo "Night Light disabled"
else
    echo "Usage: nl [on|off]"
fi
