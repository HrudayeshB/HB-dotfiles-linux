#!/bin/bash

if [ "$1" == "hide" ]; then
    gnome-extensions enable hidetopbar@mathieu.bidon.ca
    echo "TopBar will auto hide"
elif [ "$1" == "unhide" ]; then
    gnome-extensions disable hidetopbar@mathieu.bidon.ca
    echo "TopBar will not auto hide"
else
    echo "Usage: topbar [hide|unhide]"
fi

