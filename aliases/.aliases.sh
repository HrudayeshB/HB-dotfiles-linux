
# Set Brightness Function
#!/bin/zsh
sb() {
    sudo brightnessctl set "$1%" > /dev/null 2>&1
}

# My Aliases

alias listmy="~/.myscripts/commands_list.sh"

alias mc='micro'
alias e-setup='~/.myscripts/my_scripts.sh e-setup'
alias s='~/.myscripts/my_scripts.sh s'
alias y='~/.myscripts/my_scripts.sh y'
alias quartus1='~/.myscripts/my_scripts.sh quartus'
alias mygithub='~/.myscripts/my_scripts.sh mygithub'
alias eb-git='~/.myscripts/my_scripts.sh eb-git'
alias chatgpt='~/.myscripts/my_scripts.sh chatgpt'
alias whatsapp='~/.myscripts/my_scripts.sh whatsapp'

alias chans='~/.myscripts/channels.sh chans'
alias ttd='~/.myscripts/channels.sh ttd'
alias abn='~/.myscripts/channels.sh abn'
alias ntv='~/.myscripts/channels.sh ntv'

alias rename_screenshots='~/.myscripts/rename_screenshots.sh'
alias downloads_arrange='~/.myscripts/organize_downloads.sh'

alias sysboost='sudo nala update && sudo nala upgrade -y && sudo nala autoremove'

# qpd - quartus projects directory
alias qpd='cd ~/Quartus/Projects/'
alias quartus='~/.myscripts/open_quartus.sh'

# Obsidian
alias obsidian='~/.myscripts/obsidian-launcher.sh'
alias firefox='~/.myscripts/firefox-launcher.sh'

# Terminal
alias sysboost='sudo nala update && sudo nala upgrade -y'
alias c='clear'
alias ll='ls -alFh'
alias l='ls -CF'
alias lla='eza -al --icons'

# HB-PassMan
alias hbpass='~/.myscripts/passman.sh'

# icarus verilog make
alias icv='make -f ~/adld/Makefiles/makefile_icarus/Makefile'
alias icv-setup='~/.myscripts/icv_setup.sh'

# git
alias gs='git status'
alias gl1='git log --oneline'
alias gl='git log'
alias ga='git add -A'
alias gcm='git commit -m'

# Opacity of terminal
alias opc='~/.myscripts/sh_opacity.sh'

# Gnome-Extensions
alias forge='~/.myscripts/forge_toggle.sh'
alias topbar='~/.myscripts/topbar.sh'

# Show off
alias showoff='~/.myscripts/showoff.sh'
alias stopit='~/.myscripts/close.sh'
alias purple-land='~/.myscripts/purple_land.sh'

# Night light
alias nl='~/.myscripts/night_light.sh'

# AI
alias ai='python3 ~/.local/bin/sgpt'
alias jarvis='ollama run jarvis'
alias olama_serv='~/.myscripts/ollama_run.sh'
alias docker_serv='~/.myscripts/docker_service.sh'

# Docker
alias ub22='~/.myscripts/docker_ubuntu22.sh'

# ros
alias ubros2='~/.myscripts/ros_launch.sh'

# "Digital" Software
alias digital='java -jar ~/VLSI/Digital/Digital.jar'
