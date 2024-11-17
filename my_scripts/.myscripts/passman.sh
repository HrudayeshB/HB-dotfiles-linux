#!/bin/bash

# Store the current directory
current_dir=$(pwd)

# Change to the target directory
cd ~/Documents/.samabash

# Run the executable
./HB-PassMan

# Return to the original directory
cd "$current_dir"
