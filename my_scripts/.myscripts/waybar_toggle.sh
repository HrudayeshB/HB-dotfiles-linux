#!/bin/bash

CMD="$1"

case "$CMD" in
    on)
        if ! pgrep -x "waybar" > /dev/null; then
            waybar &
        fi
        ;;
    off)
        if pgrep -x "waybar" > /dev/null; then
            killall waybar
        fi
        ;;
    toggle)
        if pgrep -x "waybar" > /dev/null; then
            killall waybar
        else
            waybar &
        fi
        ;;
    *)
        echo "Usage: $0 {on|off|toggle}"
        exit 1
        ;;
esac
