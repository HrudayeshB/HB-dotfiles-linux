#!/bin/bash
# Combined script with aliases for various tasks

# ---------------------------------
# Section: e-setup
# Launch Quartus and open multiple websites
# ---------------------------------

e_setup() {
  # Function to check network connectivity
  check_network() {
    echo "Checking network connectivity..."
    if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
      echo "Network is connected."
      return 0
    else
      echo "Network is not connected. Exiting."
      exit 1
    fi
  }

  # Function to check if a process is running
  check_process_running() {
    if pgrep "$1" > /dev/null; then
      echo "$1 is already running."
    else
      echo "Launching $1..."
      "$2" &
    fi
  }

  # Check network connectivity
  check_network

  # Use timeout for the entire execution
  timeout 5s bash -c \'

  # Step 1: Launch Quartus
  quartus_app="quartus"
  quartus_command="/home/hb1240/intelFPGA_lite/20.1/quartus/bin/quartus"
  check_process_running "$quartus_app" "$quartus_command"

  # Step 2: Open the specified websites in Firefox
  urls=(
    "https://portal.e-yantra.org/profile_home"
    "https://portal.e-yantra.org/themeBook/eb/index.html"
    "https://github.com/E-yantra-EcoMender-Bot-1298/E-yantra-EcoMender-Bot---1298"
    "https://chatgpt.com/"
    "https://web.whatsapp.com/"
  )

  # Function to open websites
  open_websites() {
    echo "Opening websites in Firefox..."
    firefox "${urls[@]}" 2>/dev/null &
  }

  # Open websites
  open_websites

  # Step 3: Wait for 7 seconds
  sleep 7
  echo "Quartus launched and all websites are open."
}

# ---------------------------------
# Section: search in Google (s)
# ---------------------------------
brave_search() {
  # Function to check network connectivity
  check_network() {
    echo "Checking network connectivity..."
    if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
      echo "Network is connected."
      return 0
    else
      echo "Network is not connected. Exiting."
      exit 1
    fi
  }

  # Check if user provided input
  if [ -z "$1" ]; then
    echo "Usage: s \"search query\""
    exit 1
  fi

  # Check network connectivity
  check_network

  # Format the input as a Brave search query
  query="$*"
  search_url="https://search.brave.com/search?q=$(echo $query | sed 's/ /+/g')"

  # Open search in browser
  timeout 5s xdg-open "$search_url" 2>/dev/null
}

# ---------------------------------
# Section: search in YouTube (y)
# ---------------------------------
youtube_search() {
  # Function to check network connectivity
  check_network() {
    echo "Checking network connectivity..."
    if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
      echo "Network is connected."
      return 0
    else
      echo "Network is not connected. Exiting."
      exit 1
    fi
  }

  # Check if user provided input
  if [ -z "$1" ]; then
    echo "Usage: y \"search query\""
    exit 1
  fi

  # Check network connectivity
  check_network

  # Format the input as a YouTube search query
  query="$*"
  search_url="https://www.youtube.com/results?search_query=$(echo $query | sed 's/ /+/g')"

  # Open search in browser
  timeout 5s xdg-open "$search_url" 2>/dev/null
}

# ---------------------------------
# Section: Quartus
# Launch Quartus software
# ---------------------------------
launch_quartus() {
  SOFTWARE_PATH="/home/hb1240/intelFPGA_lite/20.1/quartus/bin/quartus"
  "$SOFTWARE_PATH"
}

# ---------------------------------
# Section: GitHub (mygithub)
# ---------------------------------
mygithub() {
  xdg-open "https://github.com/HrudayeshB" 2>/dev/null
}

eb-git() {
 xdg-open "https://github.com/E-yantra-EcoMender-Bot-1298/E-yantra-EcoMender-Bot---1298" 2>/dev/null 
}

# ---------------------------------
# Section: ChatGPT (chatgpt)
# ---------------------------------
chatgpt() {
  xdg-open "https://chat.openai.com" 2>/dev/null
}

# ---------------------------------
# Section: WhatsApp (whatsapp)
# ---------------------------------
whatsapp() {
  xdg-open "https://web.whatsapp.com/" 2>/dev/null
}


# ---------------------------------
# Script Execution: Handle commands
# ---------------------------------
case "$1" in
  e-setup)
    e_setup
    ;;
  s)
    shift
    brave_search "$@"
    ;;
  y)
    shift
    youtube_search "$@"
    ;;
  quartus1)
    launch_quartus
    ;;
  mygithub)
    mygithub
    ;;
  eb-git)
	eb-git
	;;
  chatgpt)
    chatgpt
    ;;
  whatsapp)
    whatsapp
    ;;
esac
