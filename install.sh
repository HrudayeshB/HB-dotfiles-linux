#!/bin/bash

<<<<<<< HEAD
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
=======
# Function to ask for yes/no input
ask_install() {
    read -p "$1 (y/n): " -n 1 -r
    echo    # move to new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0  # Return 0 for yes
    else
        return 1  # Return 1 for no
    fi
}

# 1. Update system
if ask_install "Do you want to update the system?"; then
    echo "Updating system..."
    sudo apt update && sudo apt upgrade -y
fi
>>>>>>> parent of 4228f247 (install script updated, new vscode theme)

# 2. Install Nala (Apt alternative)
if ask_install "Do you want to install Nala?"; then
    echo "Installing Nala..."
    sudo apt install -y nala
fi

# 3. Install VSCode with themes and extensions
if ask_install "Do you want to install VSCode with your themes and extensions?"; then
    echo "Installing Visual Studio Code..."
    sudo apt install -y software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install -y code

    # Install your VSCode extensions (replace with your extensions)
    echo "Installing VSCode extensions..."
    code --install-extension ms-python.python
    code --install-extension ms-vscode.cpptools
    code --install-extension your-theme-extension  # Add your theme
fi

<<<<<<< HEAD
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
    stow "my_scripts"
fi

if [[ -d "as_admin" ]]; then
    stow "as_admin"
fi


# Change default shell to Zsh at the end
change_default_shell
=======
# 4. Install GNOME Tweaks
if ask_install "Do you want to install GNOME Tweaks?"; then
    echo "Installing GNOME Tweaks..."
    sudo apt install -y gnome-tweaks
fi

# 5. Set GNOME keybindings
if ask_install "Do you want to set custom GNOME keybindings?"; then
    echo "Setting GNOME keybindings..."

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom0 name "'File Manager'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom0 command "'nautilus'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom0 binding "'<Super>F'"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom1 name "'Firefox'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom1 command "'firefox'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom1 binding "'<Super>B'"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom2 name "'Terminal'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom2 command "'gnome-terminal'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom2 binding "'<Super>Return'"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom3 name "'Close Window'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom3 command "'wmctrl -c :ACTIVE:'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom3 binding "'<Super><Shift>Q'"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom4 name "'Maximize Window'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom4 command "'wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz'"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom4 binding "'<Super><Shift>F'"
fi

# 6. Install GNOME Extensions
if ask_install "Do you want to install GNOME extensions (X11 gestures, rounded window corners, vitals, etc.)?"; then
    echo "Installing GNOME extensions..."
    sudo apt install -y gnome-shell-extensions

    # Install specific extensions using the extension IDs
    gnome-extensions install --force x11-gestures@joseexposito.github.io
    gnome-extensions install --force rounded-window-corners@yilozt.github.io
    gnome-extensions install --force vitals@corecoding.com
    gnome-extensions install --force hidetopbar@mathieu.bidon.ca
    gnome-extensions install --force blur-my-shell@aunetx
    gnome-extensions install --force clipboard-history@tudmotu.com
fi

# 7. Zsh and Powerlevel10k setup
if ask_install "Do you want to install Zsh and configure Powerlevel10k?"; then
    echo "Installing Zsh..."
    sudo apt install -y zsh
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.powerlevel10k
    echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

    # Apply your custom Zsh config and aliases
    echo "Stowing Zsh and aliases configurations..."
    stow zsh aliases
fi

# 8. Stow additional configurations (Neofetch, etc.)
if ask_install "Do you want to stow additional configurations (e.g., Neofetch, etc.)?"; then
    echo "Stowing Neofetch and other configurations..."
    stow neofetch
fi

# 9. Install your GNOME Terminal profile
if ask_install "Do you want to add your custom GNOME Terminal profile with personal settings?"; then
    echo "Applying GNOME Terminal customizations..."
>>>>>>> parent of 4228f247 (install script updated, new vscode theme)

    # Create a new profile and set font preferences
    PROFILE_NAME="CustomProfile"
    dconf write /org/gnome/terminal/legacy/profiles:/list "['$PROFILE_NAME']"
    dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_NAME/font "'Nerd Font Mono 15'"
    dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_NAME/use-system-font "false"
fi

# 10. Install Nerd Fonts
if ask_install "Do you want to install Nerd Fonts?"; then
    echo "Installing Nerd Fonts..."
    cp -r $HOME/HB-dotfiles-linux/fonts/* ~/.local/share/fonts/
    fc-cache -fv  # Rebuild font cache
fi

# 11. Change system font size
if ask_install "Do you want to change system font size to 12?"; then
    echo "Changing system font size..."
    gsettings set org.gnome.desktop.interface text-scaling-factor 1.2
fi

# 12. Install additional software
if ask_install "Do you want to install vim, nano, neofetch, vlc, htop, tree, gcc, and Python3?"; then
    echo "Installing additional software..."
    sudo apt install -y vim nano neofetch vlc htop tree gcc python3 python3-pip
fi

echo "Setup complete!"

