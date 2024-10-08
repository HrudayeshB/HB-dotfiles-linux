#!/bin/bash

# Function to install packages
install_package_with_nala() {
    read -p "Do you want to install $1? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        sudo nala install -y $1
    fi
}

install_package() {
    read -p "Do you want to install $1? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        sudo apt install -y $1
    fi
}

install_package "nala"

# Function to backup existing config files
backup_and_replace() {
    local target="$1"
    local source="$2"

    # Check if the target file exists
    if [[ -e "$target" ]]; then
        echo "Backing up existing file: $target"
        mv "$target" "${target}.bak"  # Backup the existing file
    fi

    # Create a symlink to the new config file
    ln -sfn "$(pwd)/$source" "$target"  # Replace with a symlink
}

# Function to install Oh My Zsh
install_oh_my_zsh() {
    read -p "Do you want to install Oh My Zsh? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

# Function to install Starship
install_starship() {
    read -p "Do you want to install Starship? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        curl -sS https://starship.rs/install.sh | sh
    fi
}

# Function to install Zsh plugins
install_zsh_plugins() {
    read -p "Do you want to install Zsh autosuggestions plugin? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    fi
    
    read -p "Do you want to install Zsh syntax highlighting plugin? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi
}

# Function to change the default shell to Zsh
change_default_shell() {
    read -p "Do you want to change your default shell to Zsh? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        chsh -s $(which zsh)
    fi
}

# Install applications
install_package_with_nala "htop"
install_package_with_nala "tree"
install_package_with_nala "python3"
install_package_with_nala "gcc"
install_package_with_nala "neofetch"
install_package_with_nala "stow"
# Add more packages as needed

# Backup and replace dotfiles
backup_and_replace "$HOME/.bashrc" "bash/.bashrc"
backup_and_replace "$HOME/.zshrc" "zsh/.zshrc"
backup_and_replace "$HOME/.vimrc" "vim/.vimrc"
backup_and_replace "$HOME/.config/nvim/init.vim" "nvim/init.vim"

# Install Oh My Zsh
install_oh_my_zsh

# Install Starship
install_starship

# Install Zsh plugins
install_zsh_plugins

# Change default shell to Zsh
change_default_shell

# Configure .zshrc to use Starship and plugins
echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> "$HOME/.zshrc"
echo 'source ~/.aliases.sh' >> "$HOME/.zshrc"

# Source the new .zshrc
source "$HOME/.zshrc"

# Stow the rest of the dotfiles
stow bash
stow neofetch
stow nvim
stow aliases
stow scripts

echo "Setup complete! Please restart your terminal or log out and log back in to apply changes."

