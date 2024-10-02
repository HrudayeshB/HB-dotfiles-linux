#!/bin/bash

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

