#!/bin/bash

# Function to uninstall packages
uninstall_package() {
    read -p "Do you want to remove $1? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        sudo apt remove --purge -y $1
    fi
}

uninstall_package_with_nala() {
    read -p "Do you want to remove $1 with Nala? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        sudo nala remove --purge -y $1
    fi
}

# Function to restore backup config files
restore_backup() {
    local target="$1"

    # Check if the backup file exists
    if [[ -e "${target}.bak" ]]; then
        echo "Restoring backup for: $target"
        mv "${target}.bak" "$target"  # Restore the original file
    else
        echo "No backup found for: $target"
    fi
}

# Function to remove stowed directories
unstow_package() {
    local package="$1"
    read -p "Do you want to unstow $package? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        stow -D "$package"
    fi
}

# Function to clean up all stowed packages and files created
cleanup_stowed_files() {
    echo "Cleaning up stowed packages and files created during the process..."

    # List of directories created during installation
    local directories=(
        ".sudo_as_admin_successful"
        "~/.oh-my-zsh"
        "~/.config/starship.toml"
    )

    # Remove each directory if it exists
    for dir in "${directories[@]}"; do
        if [[ -e $dir ]]; then
            echo "Removing: $dir"
            rm -rf "$dir"
        fi
    done
}

# Function to change the default shell back to bash (or another shell)
reset_default_shell() {
    read -p "Do you want to reset the default shell to bash? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        chsh -s $(which bash)
        echo "Your default shell has been reset to bash."
    fi
}

# Restore backup dotfiles
restore_backup "$HOME/.bashrc"
restore_backup "$HOME/.zshrc"
restore_backup "$HOME/.vimrc"

# Remove stowed directories (only if previously stowed)
unstow_package "bash"

# Remove Neofetch if it was stowed
if [[ -d "neofetch" ]]; then
    unstow_package "neofetch"
fi

# Remove Starship if it was stowed
if [[ -d "starship" ]]; then
    unstow_package "starship"
fi

unstow_package "aliases"
unstow_package "scripts"
unstow_package "as_admin"
unstow_package "vim"

# Uninstall applications
uninstall_package_with_nala "zsh"
uninstall_package_with_nala "curl"
uninstall_package_with_nala "wget"
uninstall_package_with_nala "htop"
uninstall_package_with_nala "tree"
uninstall_package_with_nala "python3"
uninstall_package_with_nala "gcc"
uninstall_package_with_nala "neofetch"
uninstall_package_with_nala "stow"
uninstall_package_with_nala "nala"
# Add more packages as needed

# Clean up all stowed files
cleanup_stowed_files

# Remove Oh My Zsh if it was installed
read -p "Do you want to remove Oh My Zsh? (y/n): " choice
if [[ "$choice" == "y" ]]; then
    rm -rf ~/.oh-my-zsh
    echo "Oh My Zsh has been removed."
fi

# Remove Starship if it was installed
read -p "Do you want to remove Starship? (y/n): " choice
if [[ "$choice" == "y" ]]; then
    rm -rf ~/.config/starship.toml
    echo "Starship has been removed."
fi

# Reset the default shell back to bash
reset_default_shell

echo "Undo complete! Please restart your terminal or log out and log back in to apply changes."

