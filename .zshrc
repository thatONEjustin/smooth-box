# NOTE: $PATH variable
# export PATH=/opt/homebrew/opt/ruby/bin:$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH
#
# TODO: learn how to expand paths with ${} for cleaner shell environment
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.deno/bin/deno:$PATH

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
fi

if [ -s "/usr/bin/cargo" ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# NOTE: zsh path
export ZSH="$HOME/.oh-my-zsh"

# NOTE: ZSH_HIST settings so we remove dupes
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

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

# NOTE: WSL / windows detection
if uname -r | grep -q 'microsoft' ; then
  if [ -d "/home/linuxbrew" ]; then
    eval "$(oh-my-posh init zsh --config $smooth/custom/oh-my-posh/themes/dracula.omp.json)"
  fi
fi

if [[ "$OSTYPE" == *"linux-gnu"* ]]; then
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
  export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"

  export GTK_THEME="Dracula"

  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# NOTE: macOS detection
if [[ $(uname) == "Darwin" ]]; then
  # alias sketchyreload='sketchybar --reload'

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

alias ll='ls -lah'
alias ln='ls -lahtr'

# NOTE: linux specific aliases
if [[ "$OSTYPE" == *"linux-gnu"* ]]; then
  # NOTE: Generic
  alias cleansyslog='sudo truncate -s 0 /var/log/syslog'

  # NOTE: swayfx
  if command -v sway > /dev/null; then
    # alias getdisplays='swaymsg -t get_outputs'
    alias getdisplays='xrandr --listmonitors'
    alias getids='swaymsg -t get_tree'
    alias wayreset='killall -SIGUSR2 waybar &!'
    alias clean_zsh_history='~/.local/scripts/fix_zsh_history.sh'
    alias swayedit='nvim $HOME/.config/sway'

    export NNN_FIFO=/tmp/nnn.fifo
    export NNN_PLUG='v:preview-tui'
  fi
fi

# NOTE: supposedly this should go before the instant prompt call
if command -V keychain > /dev/null; then
  eval "$(keychain --eval --quiet id_ed25519 id_rsa)"
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

if [ -d "$HOME/.deno/" ]; then
  export PATH=$HOME/.deno/bin:$PATH
fi

# WARN: bun shouldn't be tied to the user directory like this. just need to make sure I point to the .bun/_bun dirs?
# bun completions
[ -s "/home/justinprime/.bun/_bun" ] && source "/home/justinprime/.bun/_bun"


# TODO: Move away from p10k
#
# powerlevel10k prompt
# source /usr/.oh-my-zsh/custom/themes/powerlevel10k.zsh-theme
if [[ "$OSTYPE" == *"linux-gnu"* || $(uname) == "Darwin" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k" 

  # NOTE: instant prompt for p10k
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else 
  # NOTE: should only effect WSL

  eval "$(oh-my-posh init zsh --config $smooth/custom/oh-my-posh/themes/dracula.omp.json)"
fi

# NOTE: this is for local always on tmux
# right now i'm using title bars + border indicators
# to justify the use of tiling more and get used
# to the navigation because more and more linux 
# compatibility is happening.
#
# if [[ -z "$TMUX" ]]; then
#   tmux attach || tmux
# fi

# TODO: Figure out if there's a better way to launch zsh
# also worth considering moving shells but thats arbitrary

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git fzf sudo archlinux zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete colored-man-pages)

source $ZSH/oh-my-zsh.sh
export PATH="/home/justinprime/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/justinprime/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
