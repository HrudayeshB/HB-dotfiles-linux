#!/bin/zsh

# Set Brightness Function
sb() {
    sudo brightnessctl set "$1%" > /dev/null 2>&1
}

# My Aliases
alias mc='micro'
alias e-setup='$HOME/.myscripts/my_scripts.sh e-setup'
alias s='$HOME/.myscripts/my_scripts.sh s'
alias y='$HOME/.myscripts/my_scripts.sh y'
alias quartus1='$HOME.myscripts/my_scripts.sh quartus'
alias mygithub='$HOME/.myscripts/my_scripts.sh mygithub'
alias eb-git='$HOME/.myscripts/my_scripts.sh eb-git'
alias chatgpt='$HOME/.myscripts/my_scripts.sh chatgpt'
alias whatsapp='$HOME/.myscripts/my_scripts.sh whatsapp'
alias listmy='$HOME/.myscripts/my_scripts.sh listmy'

alias chans='~/.myscripts/channels.sh chans'
alias ttd='~/.myscripts/channels.sh ttd'
alias abn='~/.myscripts/channels.sh abn'
alias ntv='~/.myscripts/channels.sh ntv'

alias sysboost='sudo nala update && sudo nala upgrade -y && sudo nala autoremove'

# qpd - quartus projects directory
alias qpd='cd $HOME/Quartus/Projects/'
alias quartus='~/.myscripts/open_quartus.sh'

#alias sysboost='sudo nala update && sudo nala upgrade -y && sudo nala autoremove'

alias c='clear'
alias ll='ls -alFh'
alias l='ls -CF'

# git
alias gs='git status'
alias gl1='git log --oneline'
alias gl='git log'
alias ga='git add -A'

# Opacity of terminal
alias opc='~/.myscripts/sh_opacity.sh'

# Night light
alias nl='~/.myscripts/night_light.sh'

# AI
alias ai='python3 ~/.local/bin/sgpt'
alias jarvis='ollama run jarvis'
