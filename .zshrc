# $PATH variable
export PATH=/opt/homebrew/opt/ruby/bin:$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

# zsh path
export ZSH="$HOME/.oh-my-zsh"

# neovim please
export VISUAL=nvim
export EDITOR=nvim

# personalized directories
export configd="$HOME/.config"
export workd="$HOME/work"
export gitd="$HOME/github"
export smooth="$gitd/smooth-box"
export tmuxd="$HOME/.config/tmux"

# generic linux detection
if [[ "$OSTYPE" == *"linux-gnu"* ]]; then
  alias cleansyslog='sudo truncate -s 0 /var/log/syslog'

  if command -v sway > /dev/null; then
    alias getids='swaymsg -t get_tree'
    alias wayreset='killall -SIGUSR2 waybar &!'
  fi
fi

# macOS detection
if [[ $(uname) == "Darwin" ]]; then
  echo 'Mac OS'
fi

# OS agnostic aliases
alias zload='source $HOME/.zshrc'
alias zedit='nvim $HOME/.zshrc'
alias tedit='nvim $HOME/.tmux.conf'
alias tkill='tmux kill-session -a'
alias nedit='$HOME/.config/nvim/ && nvim .'

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

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git fd fzf sudo archlinux zoxide)

# powerlevel10k prompt
# source /usr/.oh-my-zsh/custom/themes/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k" 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/init-nvm.sh


# NOTE: macOS nvm configs via homebrew
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# WARN: Figure out an actual ruby solution? why is it so hard to get this dang language usable
source $HOME/.rvm/scripts/rvm

# bun completions
[ -s "/home/justinprime/.bun/_bun" ] && source "/home/justinprime/.bun/_bun"
