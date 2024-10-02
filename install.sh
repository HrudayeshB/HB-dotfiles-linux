#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install a package if not installed
install_if_not_installed() {
    local package_name=$1
    if ! command_exists "$package_name"; then
        echo "$package_name is not installed. Installing..."
        sudo apt update && sudo apt install -y "$package_name"
    else
        echo "$package_name is already installed."
    fi
}

# Install necessary programs
echo "Checking for required applications..."

install_if_not_installed "neofetch"
install_if_not_installed "i3"
install_if_not_installed "vim"
install_if_not_installed "zsh"

# Symlink dotfiles using stow
echo "Symlinking dotfiles using stow..."

stow bash
stow zsh
stow vim
stow i3
stow neofetch

echo "Dotfiles symlinked successfully!"
