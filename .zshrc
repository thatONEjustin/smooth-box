
# If you come from bash you might have to change your $PATH.
export PATH=/opt/homebrew/opt/ruby/bin:$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

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
alias tkill='tmux kill-session -a'
alias nedit='$HOME/.config/nvim/ && nvim .'
alias cleansyslog='sudo truncate -s 0 /var/log/syslog'

alias wayreset='killall -SIGUSR2 waybar &!'

# check if tmux and launch
if [[ -z "$TMUX" ]]; then
  tmux attach || tmux
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# alias fd="fdfind --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim && clear"
# alias ll="lsd -lah"
#
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fd fzf sudo archlinux zoxide)

# powerlevel10k prompt
# source /usr/.oh-my-zsh/custom/themes/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k" 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh
# ZSH_THEME="spaceship"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
# export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/init-nvm.sh


# NOTE: macOS nvm configs via homebrew
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# WARN: Figure out an actual ruby solution? why is it so hard to get this dang language usable
# source $HOME/.rvm/scripts/rvm

# supposed flags for ruby
# export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# bun completions
[ -s "/home/justinprime/.bun/_bun" ] && source "/home/justinprime/.bun/_bun"
