#!/bin/zsh

# Set Brightness Function
sb() {
    sudo brightnessctl set "$1%" > /dev/null 2>&1
}

# My Aliases
alias e-setup='bash /home/hb1240/.myscripts/my_scripts.sh e-setup'
alias s='bash /home/hb1240/.myscripts/my_scripts.sh s'
alias y='bash /home/hb1240/.myscripts/my_scripts.sh y'
alias quartus1='bash /home/hb1240/.myscripts/my_scripts.sh quartus'
alias mygithub='bash /home/hb1240/.myscripts/my_scripts.sh mygithub'
alias chatgpt='bash /home/hb1240/.myscripts/my_scripts.sh chatgpt'
alias whatsapp='bash /home/hb1240/.myscripts/my_scripts.sh whatsapp'
alias listmy='bash /home/hb1240/.myscripts/my_scripts.sh listmy'

alias chans='~/.myscripts/channels.sh chans'
alias ttd='~/.myscripts/channels.sh ttd'
alias abn='~/.myscripts/channels.sh abn'
alias ntv='~/.myscripts/channels.sh ntv'

# qpd - quartus projects directory
alias qpd='cd /home/hb1240/Quartus/Projects/'
alias quartus='~/.myscripts/open_quartus.sh'

#alias sysboost='sudo nala update && sudo nala upgrade -y && sudo nala autoremove'

alias c='clear'
alias ll='ls -alFh'
alias l='ls -CF'

# git
alias gs='git status'
alias gl1='git log --oneline'
alias gl='git log'

# opacity of terminal
alias opc='~/.myscripts/sh_opacity.sh'
