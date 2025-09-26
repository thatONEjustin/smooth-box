#!/bin/zsh

rm -rf ~/.oh-my-zsh/custom
ln -s $HOME/github/smooth-box/.oh-my-zsh/custom ~/.oh-my-zsh/custom

cd $smooth/
stow --target="$HOME" --dir="$HOME/github/smooth-box" .
