#!/bin/bash

# Play live wallpaper for 2 seconds
mpv --no-border --no-input-default-bindings --loop --really-quiet --geometry=100%x100%+0+0 --fs --no-osd-bar --vf=fade=t=out:st=0:d=1 ~/Pictures/Wallpapers/deer_live.mp4 &

MPV_PID=$!

# Wait for 2 seconds
sleep 3

# Kill live wallpaper player
kill $MPV_PID

# Apply normal wallpaper with swaybg
swaybg -i ~/Pictures/Wallpapers/deer.jpg -m fill &

waybar

exit 0
