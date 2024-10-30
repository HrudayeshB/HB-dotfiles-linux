#!/bin/bash

# Step 1: Enable Forge extension
gnome-extensions enable forge@jmmaranan.com
sleep 1
# Step 2: Open terminals in sequence for snapping

# Terminal 1: Top-left corner - running Cava
gnome-terminal -- bash -c "cava; exec bash" &
sleep 1  # Allow Forge to snap

# Terminal 2: Top-right corner - running pipes.sh
gnome-terminal -- bash -c "pipes.sh; exec bash" &
sleep 1  # Allow Forge to snap

# Simulate Alt + Left Arrow to switch focus back to the first terminal
xdotool key Alt+Left
sleep 1

# Terminal 3: Bottom-right corner - running cmatrix
gnome-terminal -- bash -c "cmatrix; exec bash" &
sleep 1  # Allow Forge to snap

# Step 3: Play the mp3 file in the background
mpv $HOME/Music/Red_Sea.mp3 --no-video --start=00:00:38 > /dev/null 2>&1 &
sleep 1

clear

sleep 1

neofetch

#echo "Setup complete! Terminals are running in each corner with the desired commands, and YouTube is playing on the second desktop."
