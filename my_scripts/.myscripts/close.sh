#!/bin/bash

# Step 1: Disable the Forge extension
gnome-extensions disable forge@jmmaranan.com  # Replace with the actual extension ID

# Step 2: Close all terminals running cava, pipes.sh, and cmatrix
pkill -f cava
pkill -f pipes.sh
pkill -f cmatrix
pkill mpv  # Or `pkill -f vlc` if you used VLC instead of mpv
pkill -f gnome-terminal  # Closes any remaining terminal

# Step 3: Stop the mp3 playback

echo "All programs have been closed, and the Forge extension is disabled."
