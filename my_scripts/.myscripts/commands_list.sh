# # ---------------------------------
# # Function to list all commands
# # ---------------------------------
# 
# echo "   Available Commands/Aliases:"
# echo "-------------------------------------------------------------------------"
# printf "   %-20s - %s\n" "e-setup" "Launches Quartus and opens specified websites"
# printf "   %-20s - %s\n" "s <query>" "Searches Brave with the provided query"
# printf "   %-20s - %s\n" "y <query>" "Searches YouTube with the provided query"
# printf "   %-20s - %s\n" "quartus1" "Launches the Quartus software"
# printf "   %-20s - %s\n" "mygithub" "Opens GitHub profile in the default browser"
# printf "   %-20s - %s\n" "eb-git" "Opens GitHub Repo of our Eyantra team"
# printf "   %-20s - %s\n" "chatgpt" "Opens ChatGPT in the default browser"
# printf "   %-20s - %s\n" "listmy" "Lists all available commands with descriptions"
# printf "   %-20s - %s\n" "whatsapp" "Opens WhatsApp Web in default browser"
# printf "   %-20s - %s\n" "quartus <project>" "Opens Quartus project"
# printf "   %-20s - %s\n" "sb <%>" "Set Brightness to some percentage"
# printf "   %-20s - %s\n" "opc <%>" "Set Opacity of the terminal to some percentage"
# printf "   %-20s - %s\n" "nl <on/off>" "Turn Night Light (on) or (off)"
# printf "   %-20s - %s\n" "c" "clear the terminal"
# printf "   %-20s - %s\n" "qpd" "Go to Quartus Projects Directory"
# printf "   %-20s - %s\n" "gs" "git status"
# printf "   %-20s - %s\n" "gl1" "git log --oneline"
# printf "   %-20s - %s\n" "gl" "git log"
# printf "   %-20s - %s\n" "ga" "git add -A"
# printf "   %-20s - %s\n" "ollama <on/off>" "Start or stop ollama service"
# printf "   %-20s - %s\n" "docker_serv <on/off>" "Start or stop Docker service"
# printf "   %-20s - %s\n" "ai" "Activates Shell-GPT running llama3.2:1b"
# printf "   %-20s - %s\n" "ga" "Activates Jarvis llama3.2:1b custom ai model"
# echo "-------------------------------------------------------------------------"
# 

#!/bin/bash

# Define color variables for styling
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
BOLD="\e[1m"
RESET="\e[0m"

# Function to print each command with description
print_command() {
    printf "   ${CYAN}${BOLD}%-20s${RESET} - ${YELLOW}%s${RESET}\n" "$1" "$2"
}

# Print the title with styling
echo "${BOLD}${GREEN}   Available Commands/Aliases:${RESET}"
echo "${BOLD}${CYAN}-------------------------------------------------------------------------${RESET}"

# List of commands and their descriptions
print_command "e-setup" "Launches Quartus and opens specified websites"
print_command "s <query>" "Searches Brave with the provided query"
print_command "y <query>" "Searches YouTube with the provided query"
print_command "quartus1" "Launches the Quartus software"
print_command "mygithub" "Opens GitHub profile in the default browser"
print_command "eb-git" "Opens GitHub Repo of our Eyantra team"
print_command "chatgpt" "Opens ChatGPT in the default browser"
print_command "listmy" "Lists all available commands with descriptions"
print_command "whatsapp" "Opens WhatsApp Web in default browser"
print_command "quartus <project>" "Opens Quartus project"
print_command "sb <%>" "Set Brightness to some percentage"
print_command "opc <%>" "Set Opacity of the terminal to some percentage"
print_command "nl <on/off>" "Turn Night Light (on) or (off)"
print_command "c" "Clear the terminal"
print_command "qpd" "Go to Quartus Projects Directory"
print_command "gs" "git status"
print_command "gl1" "git log --oneline"
print_command "gl" "git log"
print_command "ga" "git add -A"
print_command "ollama <on/off>" "Start or stop Ollama service"
print_command "docker_serv <on/off>" "Start or stop Docker service"
print_command "ai" "Activates Shell-GPT running llama3.2:1b"
print_command "ga" "Activates Jarvis llama3.2:1b custom AI model"

# End line with styling
echo "${BOLD}${CYAN}-------------------------------------------------------------------------${RESET}"