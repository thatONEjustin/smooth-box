# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

export VISUAL=nvim
export EDITOR=nvim

export configd="$HOME/.config"
export workd="$HOME/work"
export gitd="$HOME/github"
export smooth="$gitd/smooth-box"
export tmuxd="$smooth/home/.config/tmux"

# Aliases
alias zedit='nvim $smooth/home/.zshrc'
alias zload='source $smooth/home/.zshrc'
alias tedit='nvim $smooth/home/.tmux.conf'
alias nedit='$smooth/home/.config/nvim/ && nvim .'
alias credit='nvim $smooth/home/.config/alacritty/alacritty.yml'
alias cleansyslog='sudo truncate -s 0 /var/log/syslog'

alias fd="fdfind --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim && clear"
alias ll="lsd -lah"
alias bat="batcat"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh

source /usr/share/zplug/init.zsh

if [ "$TMUX" = "" ]; then tmux; fi

# bun completions
[ -s "/home/justinprime/.bun/_bun" ] && source "/home/justinprime/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# echo 'source "/etc/profile.d/rvm.sh"'
source "/etc/profile.d/rvm.sh"
