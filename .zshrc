# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.cargo/bin

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
export tmuxd="$HOME/.config/tmux"

# Aliases
alias zedit='nvim $HOME/.zshrc'
alias zload='source $HOME/.zshrc'
alias tedit='nvim $HOME/.tmux.conf'
alias nedit='$HOME/.config/nvim/ && nvim .'
alias cleansyslog='sudo truncate -s 0 /var/log/syslog'

# alias fd="fdfind --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim && clear"
# alias ll="lsd -lah"

# alias sedit='nvim ~/.config/sway/config'

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
# ZSH_THEME="spaceship"

# bun completions
# [ -s "/home/justinprime/.bun/_bun" ] && source "/home/justinprime/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# TODO: Figure out an actual ruby solution? why is it so hard to get this dang language usable

# rvm has yet to install ruby for me on any machine.
# source /home/justinprime/.rvm/scripts/rvm
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# check if tmux and launch
if [ "$TMUX" = "" ]; then tmux; fi
