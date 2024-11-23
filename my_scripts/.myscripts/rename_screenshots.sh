#!/bin/bash
cd ~/Pictures/Screenshots || exit 1

rename 's/^Screenshot from /Shot_/; s/ /_/g' "Screenshot from "*.png

cd - > /dev/null 2>&1
echo "Renamed screenshots"
