#!/bin/bash
#!/bin/zsh

if [ "$1" == "on" ]; then
    gnome-extensions enable forge@jmmaranan.com ;
    gnome-extensions disable hidetopbar@mathieu.bidon.ca
    echo "Welcome to Purple-Land"
elif [ "$1" == "off" ]; then
    gnome-extensions disable forge@jmmaranan.com ;
    gnome-extensions enable hidetopbar@mathieu.bidon.ca
    echo "Exiting Purple-Land"
else
    echo "Usage: purple-land [on|off]"
fi
