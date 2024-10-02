#!/bin/bash

# Define a function to handle the commands
chans() {
  echo "Available Channels:"
  echo "-------------------------------"
  echo "1 | ABN  : abn"
  echo "2 | TTD  : ttd"
  echo "3 | NTV  : ntv"
  echo "-------------------------------"
}

handle_command() {
  case "$1" in
    "ttd")
      # Suppress Firefox error messages
      xdg-open "https://www.youtube.com/watch?v=mTm4j5NWf3s" 2>/dev/null
      ;;
    "abn")
      xdg-open "https://www.youtube.com/watch?v=HoYsWagMFfE" 2>/dev/null
      ;;
    "ntv")
      xdg-open "https://www.youtube.com/watch?v=L0RktSIM980" 2>/dev/null
      ;;
    chans)
      chans
      exit
      ;;
    *)
      echo "Usage: $0 {ttd|abn|ntv}"
      exit 1
      ;;
  esac
}

# Open the URL and then use xdotool to control the browser
handle_command "$1"

# Wait for the browser to open and load the page
sleep 4

# Bring the browser window to focus
xdotool search --onlyvisible --class "firefox" windowactivate

# Simulate key presses using xdotool to play the video and go fullscreen
xdotool key space  # Play the video
# sleep 1            # Wait for the play command to be processed
xdotool key f      # Toggle fullscreen

