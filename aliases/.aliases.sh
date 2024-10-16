#!/bin/zsh

# Set Brightness Function
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

alias sysboost='sudo nala update && sudo nala upgrade -y && sudo nala autoremove'

# qpd - quartus projects directory
alias qpd='cd ~/Quartus/Projects/'
alias quartus='~/.myscripts/open_quartus.sh'

#alias sysboost='sudo nala update && sudo nala upgrade -y && sudo nala autoremove'

alias c='clear'
alias ll='ls -alFh'
alias l='ls -CF'

# icarus verilog make
alias icv='make -f ~/adld/Makefiles/makefile_icarus/Makefile'

# git
alias gs='git status'
alias gl1='git log --oneline'
alias gl='git log'
alias ga='git add -A'
alias gcm='git commit -m'

# Opacity of terminal
alias opc='~/.myscripts/sh_opacity.sh'

# Night light
alias nl='~/.myscripts/night_light.sh'

# AI
alias ai='python3 ~/.local/bin/sgpt'
alias jarvis='ollama run jarvis'
alias olama_serv='~/.myscripts/ollama_run.sh'
alias docker_serv='~/.myscripts/docker_service.sh'
