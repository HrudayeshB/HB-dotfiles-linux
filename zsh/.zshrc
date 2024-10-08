ZSH_THEME=""

#Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history)
source $ZSH/oh-my-zsh.sh

# Start Neofetch on startup
neofetch

# Source aliases
source ~/.aliases.sh

#StarShip
eval "$(starship init zsh)"
