# NOTE: $PATH variable
export PATH=/opt/homebrew/opt/ruby/bin:$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH


# NOTE: zsh path
export ZSH="$HOME/.oh-my-zsh"

# NOTE: neovim please
export VISUAL=nvim
export EDITOR=nvim

# NOTE: pager
if command -v sway > /dev/null; then
  export MANPAGER="/usr/bin/most -s"
fi

# NOTE: personalized directories
export configd="$HOME/.config"
export workd="$HOME/work"
export gitd="$HOME/github"
export smooth="$gitd/smooth-box"
export tmuxd="$HOME/.config/tmux"

# NOTE: additional package directories
export NVM_DIR="$HOME/.nvm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NOTE: generic linux detection
if [[ "$OSTYPE" == *"linux-gnu"* ]]; then
  alias cleansyslog='sudo truncate -s 0 /var/log/syslog'

  if command -v sway > /dev/null; then
    alias getdisplays='swaymsg -t get_outputs'
    alias getids='swaymsg -t get_tree'
    alias wayreset='killall -SIGUSR2 waybar &!'
  fi

fi

if uname -r | grep -q 'microsoft' ; then
  if [ -d "/home/linuxbrew" ]; then
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
    export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
    export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"
  fi
fi

# NOTE: macOS detection
if [[ $(uname) == "Darwin" ]]; then
  alias sketchyreload='sketchybar --reload'

  # homebrew
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  # check if tmux and launch
  if [[ -z "$TMUX" ]]; then
    tmux attach || tmux
  fi
fi

# OS agnostic aliases
alias zload='source $HOME/.zshrc'
alias zedit='nvim $HOME/.zshrc'
alias tedit='nvim $HOME/.tmux.conf'
alias tkill='tmux kill-session -a'
alias nedit='$HOME/.config/nvim/ && nvim .'
alias ll='ls -lahtr'

alias ll='ls -lah'
alias ln='ls -lahtr'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# NOTE: Dev Tools like **nvm**, **rvm**, **bun**, etc. 
# NOTE: Node Version Manager
if [ -d '/usr/share/nvm' ]; then
  source /usr/share/nvm/init-nvm.sh
fi

# NOTE: Ruby Version Manager
if [ -d "$HOME/.rvm/scripts/" ]; then
  source $HOME/.rvm/scripts/rvm
fi

# WARN: bun shouldn't be tied to the user directory like this. just need to make sure I point to the .bun/_bun dirs?
# bun completions
[ -s "/home/justinprime/.bun/_bun" ] && source "/home/justinprime/.bun/_bun"

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git fd fzf sudo archlinux zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete colored-man-pages)

# TODO: Move away from p10k
#
# powerlevel10k prompt
# source /usr/.oh-my-zsh/custom/themes/powerlevel10k.zsh-theme
# ZSH_THEME="powerlevel10k/powerlevel10k" 

# NOTE: ZSH_HIST settings so we remove dupes
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

