#!/bin/bash

# Define your terminal profile (replace 'Unnamed' with your profile name if different)
PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default)
PROFILE=${PROFILE:1:-1}  # Remove extra quotes

# Set transparency percentage (adjust this value between 0 and 100)
TRANSPARENCY=$1

# Apply the transparency setting
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/ background-transparency-percent $TRANSPARENCY

echo "Transparency set to $TRANSPARENCY%"
