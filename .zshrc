# TODO: learn how to expand paths with ${} for cleaner shell environment
export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -d "$HOME/.deno/" ]; then
  export PATH=$HOME/.deno/bin:$PATH
  export PATH=$HOME/.deno/bin/deno:$PATH
    
  if [ -s "/home/justinprime/.deno/env" ]; then
    . "/home/justinprime/.deno/env"
  fi
fi

if [ -d "$HOME/audio-orchestrator-ffmpeg/bin/ffmpeg" ]; then
  export PATH=$HOME/audio-orchestrator-ffmpeg/bin/ffmpeg:$PATH
fi

if [ -d "/home/justinprime/.config/herd-lite/bin" ]; then
  export PATH="/home/justinprime/.config/herd-lite/bin:$PATH"
  export PHP_INI_SCAN_DIR="/home/justinprime/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
fi

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
fi

if [ -d "/home/justinprime/.turso" ]; then
  export PATH=/home/justinprime/.turso:$PATH
fi

if [ -d "/home/justinprime/go/bin/" ]; then
  export PATH=/home/justinprime/go/bin:$PATH
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


# INFO: OS agnostic aliases
alias zload='source $HOME/.zshrc'
alias zedit='nvim $HOME/.zshrc'
alias tedit='nvim $HOME/.tmux.conf'
alias tkill='tmux kill-session -a'
alias nedit='$HOME/.config/nvim/ && nvim .'
alias ll='ls -lah'
alias ln='ls -lahtr'

# INFO: macOS specific
if [[ $(uname) == "Darwin" ]]; then
  # eval "$(ssh-agent)"
  alias sketchyreload='sketchybar --reload'
fi 

# INFO: linux specific aliases
if [[ "$OSTYPE" == *"linux-gnu"* ]]; then

  alias cleansyslog='sudo truncate -s 0 /var/log/syslog'

  # INFO: swayfx
  if command -v sway > /dev/null; then
    # alias getdisplays='swaymsg -t get_outputs'
    alias getdisplays='xrandr --listmonitors'
    alias getids='swaymsg -t get_tree'
    alias wayreset='killall -SIGUSR2 waybar &!'
    alias clean_zsh_history='~/.local/scripts/fix_zsh_history.sh'
    alias swayedit='nvim $HOME/.config/sway'

    alias set_primary_display='~/.local/scripts/set_default_monitor.sh'

    export NNN_FIFO=/tmp/nnn.fifo
    export NNN_PLUG='v:preview-tui'
  fi
fi


# INFO: Dev Tools like **nvm**, **rvm**, **bun**, etc. 
if [ -d '/usr/share/nvm' ]; then
  source /usr/share/nvm/init-nvm.sh
fi

if [ -d "$HOME/.rvm/scripts/" ]; then
  source $HOME/.rvm/scripts/rvm
fi


# WARN: bun shouldn't be tied to the user directory like this. just need to make sure I point to the .bun/_bun dirs?
# bun completions
[ -s "/home/justinprime/.bun/_bun" ] && source "/home/justinprime/.bun/_bun"

# NOTE: supposedly this should go before the instant prompt call
# NOTE: leaving this in because keychain availability means auto login quietly
# if command -V keychain > /dev/null; then
#   eval "$(keychain --eval --quiet id_ed25519 id_rsa)"
# fi
#
# if [[ $(uname) == "Darwin" ]]; then
#   eval "$(ssh-agent)"
# fi

# if eval "$(ssh-agent)" 1> /dev/null; then
#
# fi

# TODO: Continue learning omp format to move away from all of this.
# NOTE: ZSH Theme configuration 
if [[ "$OSTYPE" == *"linux-gnu"* || $(uname) == "Darwin" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k" 

  eval "$(ssh-agent)" 1> /dev/null

  # NOTE: instant prompt for p10k
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else 
  # NOTE: should only effect WSL
  # WARN: So I had this which was a duplicate of the entry below it, which seems to have a much cleaner test for WSL.
  # eval "$(oh-my-posh init zsh --config $smooth/custom/oh-my-posh/themes/dracula.omp.json)"
fi

# NOTE: WSL / windows detection
if uname -r | grep -q 'microsoft' ; then
  if [ -d "/home/linuxbrew" ]; then
    eval "$(oh-my-posh init zsh --config $smooth/custom/oh-my-posh/themes/dracula.omp.json)"
  fi
fi

# NOTE: macOS detection
if [[ $(uname) == "Darwin" ]]; then
  # eval "$(ssh-agent)"
  alias sketchyreload='sketchybar --reload'

  # TODO: Clean up nvm mess
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  # check if tmux and launch
  if [[ -z "$TMUX" ]]; then
    tmux attach || tmux
  fi
fi

if [[ -z "$TMUX" ]]; then
  tmux attach || tmux
fi


# NOTE: ZSH plugins
plugins=(git fzf sudo zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete colored-man-pages)

source $ZSH/oh-my-zsh.sh

