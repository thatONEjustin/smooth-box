#!/bin/zsh

rm -rf ~/.config/pavucontrol.ini
wait
rm -rf ~/.oh-my-zsh/custom
wait
zsh "$ZSH/tools/upgrade.sh"
wait

cd $smooth/
stow --target="$HOME" --dir="$HOME/github/smooth-box" .
