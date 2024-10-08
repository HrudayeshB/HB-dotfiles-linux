#!/bin/bash

# Function to install packages
install_package() {
    read -p "Do you want to install $1? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        sudo apt install -y $1
        return 1  # Indicate that the package was installed
    fi
    return 0  # Indicate that the package was not installed
}

install_package "nala"

install_package_with_nala() {
    read -p "Do you want to install $1? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        sudo nala install -y $1
        return 1  # Indicate that the package was installed
    fi
    return 0  # Indicate that the package was not installed
}

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

# Function to install Oh My Zsh without switching the shell mid-script
install_oh_my_zsh() {
    read -p "Do you want to install Oh My Zsh? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        # Prevent switching to Zsh mid-script
        RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        return 1  # Indicate that Oh My Zsh was installed
    fi
    return 0  # Indicate that Oh My Zsh was not installed
}

# Function to install Starship
install_starship() {
    read -p "Do you want to install Starship? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        curl -sS https://starship.rs/install.sh | sh
        return 1  # Indicate that Starship was installed
    fi
    return 0  # Indicate that Starship was not installed
}

# Function to install Zsh plugins
install_zsh_plugins() {
    local installed=0

    read -p "Do you want to install Zsh autosuggestions plugin? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        ((installed++))  # Increment the count of installed plugins
    fi
    
    read -p "Do you want to install Zsh syntax highlighting plugin? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        ((installed++))  # Increment the count of installed plugins
    fi

    return $installed  # Return the count of installed plugins
}

# Function to change the default shell to Zsh after script finishes
change_default_shell() {
    read -p "Do you want to change your default shell to Zsh? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        chsh -s $(which zsh)
        echo "Your default shell has been changed to Zsh. Please restart your terminal."
    fi
}

# Track installed programs for stowing later
installed_packages=()

# Install applications
if install_package_with_nala "zsh"; then installed_packages+=("zsh"); fi
if install_package_with_nala "curl"; then installed_packages+=("curl"); fi
if install_package_with_nala "wget"; then installed_packages+=("wget"); fi
if install_package_with_nala "htop"; then installed_packages+=("htop"); fi
if install_package_with_nala "tree"; then installed_packages+=("tree"); fi
if install_package_with_nala "python3"; then installed_packages+=("python3"); fi
if install_package_with_nala "gcc"; then installed_packages+=("gcc"); fi
if install_package_with_nala "neofetch"; then installed_packages+=("neofetch"); fi
if install_package_with_nala "stow"; then installed_packages+=("stow"); fi
# Add more packages as needed

# Backup and replace dotfiles
backup_and_replace "$HOME/.bashrc" "bash/.bashrc"
backup_and_replace "$HOME/.zshrc" "zsh/.zshrc"
backup_and_replace "$HOME/.vimrc" "vim/.vimrc"

# Install Oh My Zsh without switching to Zsh immediately
if install_oh_my_zsh; then installed_packages+=("oh-my-zsh"); fi

# Install Starship
if install_starship; then installed_packages+=("starship"); fi

# Install Zsh plugins and capture if any were installed
plugins_installed=$(install_zsh_plugins)

# Create .zshrc based on user selections
cat <<EOL > "$HOME/.zshrc"
ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME=""

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history)
source \$ZSH/oh-my-zsh.sh

# Start Neofetch on startup
EOL

# Add Neofetch line if user chose to install it
if [[ $plugins_installed -gt 0 ]]; then
    echo "neofetch" >> "$HOME/.zshrc"
fi

# Source aliases
echo 'source ~/.aliases.sh' >> "$HOME/.zshrc"

# Starship initialization
echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"

# Stow the installed packages
for pkg in "${installed_packages[@]}"; do
    stow "$pkg"
done

# Stow Neofetch if installed
if [[ " ${installed_packages[@]} " =~ " neofetch " ]]; then
    read -p "Do you want to stow Neofetch? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        stow "neofetch"
    fi
fi

# Stow Starship if installed
if [[ " ${installed_packages[@]} " =~ " starship " ]]; then
    read -p "Do you want to stow Starship? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        stow "starship"
    fi
fi

# Stow the aliases and scripts folders
if [[ -d "aliases" ]]; then
    stow "aliases"
fi

if [[ -d "my_scripts" ]]; then
    stow "myscripts"
fi

if [[ -d "as_admin" ]]; then
    stow "as_admin"
fi


# Change default shell to Zsh at the end
change_default_shell

echo "Setup complete! Please restart your terminal or log out and log back in to apply changes."

