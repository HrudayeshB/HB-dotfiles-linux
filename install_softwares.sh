#!/bin/bash

# Define colors for better aesthetics
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
CYAN="\e[36m"
BOLD="\e[1m"
RESET="\e[0m"

# Flag to track if we are installing all packages without confirmation
INSTALL_ALL_PACKAGES=false

# Print a colorful message
print_message() {
    echo -e "${CYAN}$1${RESET}"
}

# Function to ask for confirmation (Yes/No) with default Yes
confirm_install() {
    local package_name="$1"
    
    # If installing all packages, skip the confirmation
    if [[ "$INSTALL_ALL_PACKAGES" == true ]]; then
        return 0  # Yes (install by default)
    fi

    echo -e "Do you want to install ${BOLD}${package_name}${RESET}? [Y/n]: "
    read -r choice
    if [[ -z "$choice" || "$choice" =~ ^[Yy]$ ]]; then
        return 0  # Yes (default)
    else
        return 1  # No
    fi
}

# Function to install a package
install_package() {
    local package_name="$1"
    if confirm_install "$package_name"; then
        print_message "Installing ${BOLD}${package_name}${RESET}..."
        sudo apt install -y "$package_name"
        echo -e "${GREEN}Installed ${package_name} successfully!${RESET}\n"
    else
        echo -e "${YELLOW}Skipping ${package_name}.${RESET}\n"
    fi
}

# Function to install a package with Nala
install_package_with_nala() {
    local package_name="$1"
    if confirm_install "$package_name"; then
        print_message "Installing ${BOLD}${package_name}${RESET} with Nala..."
        sudo nala install -y "$package_name"
        echo -e "${GREEN}Installed ${package_name} successfully!${RESET}\n"
    else
        echo -e "${YELLOW}Skipping ${package_name}.${RESET}\n"
    fi
}

# Function to clone and install Neovim from GitHub
install_neovim() {
    if confirm_install "Neovim from GitHub"; then
        print_message "Installing ${BOLD}Neovim${RESET} from GitHub..."
        git clone https://github.com/neovim/neovim.git
        cd neovim && make CMAKE_BUILD_TYPE=Release
        sudo make install
        cd ..
        echo -e "${GREEN}Installed Neovim successfully!${RESET}\n"
    else
        echo -e "${YELLOW}Skipping Neovim.${RESET}\n"
    fi
}

# Function to install Oh My Zsh and plugins
install_oh_my_zsh() {
    if confirm_install "Oh My Zsh"; then
        print_message "Installing ${BOLD}Oh My Zsh${RESET}..."
        RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo -e "${GREEN}Installed Oh My Zsh successfully!${RESET}\n"
        
        # Install Zsh plugins
        if confirm_install "Zsh Autosuggestions plugin"; then
            git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
            echo -e "${GREEN}Installed Zsh Autosuggestions plugin!${RESET}\n"
        else
            echo -e "${YELLOW}Skipping Zsh Autosuggestions.${RESET}\n"
        fi
        
        if confirm_install "Zsh Syntax Highlighting plugin"; then
            git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
            echo -e "${GREEN}Installed Zsh Syntax Highlighting plugin!${RESET}\n"
        else
            echo -e "${YELLOW}Skipping Zsh Syntax Highlighting.${RESET}\n"
        fi
    else
        echo -e "${YELLOW}Skipping Oh My Zsh.${RESET}\n"
    fi
}

# Prompt if user wants to install all packages
echo -e "${BOLD}Welcome to the Software Install Script!${RESET}"
read -p "Do you want to install all packages? [y/N]: " install_all

# If "yes", proceed with installing all without asking
if [[ "$install_all" =~ ^[Yy]$ ]]; then
    INSTALL_ALL_PACKAGES=true
    print_message "Proceeding with installation of all packages without confirmation...\n"
else
    print_message "Proceeding with individual selections...\n"
fi

# Install packages
install_package "nala"
install_package_with_nala "zsh"
install_package_with_nala "nano"
install_package_with_nala "micro"
install_package_with_nala "curl"
install_package_with_nala "stow"
install_package_with_nala "wget"
install_package_with_nala "tree"
install_package_with_nala "python3"
install_package_with_nala "gcc"
install_package_with_nala "neofetch"

# Install Starship
if confirm_install "Starship"; then
    print_message "Installing ${BOLD}Starship${RESET}..."
    curl -sS https://starship.rs/install.sh | sh
    echo -e "${GREEN}Installed Starship successfully!${RESET}\n"
fi

# Install VSCode
if confirm_install "VSCode"; then
    print_message "Installing ${BOLD}VSCode${RESET}..."
    sudo apt install -y software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install -y code
    echo -e "${GREEN}Installed VSCode successfully!${RESET}\n"
fi

# Install Neovim from GitHub
install_neovim

# Install Oh My Zsh and plugins
install_oh_my_zsh

# Final message
echo -e "${BOLD}${GREEN}All installations are complete!${RESET}"

