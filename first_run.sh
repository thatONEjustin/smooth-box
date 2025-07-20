#!/bin/bash

personal_directories=("work" "github")

for i in "${personal_directories[@]}"; do
    if [ ! -d "$HOME/$i" ]; then
        mkdir -p $HOME/$i
    fi
done

if ! command -v git &>/dev/null; then
    eval "$(pacman -S git)"
    wait
fi

if ! command -v stow &>/dev/null; then
    eval "$(pacman -S stow)"
    wait
fi

if ! command -v zsh &>/dev/null; then
    eval "$(pacman -S zsh)"
    wait
fi

if ! command -v yay &>/dev/null; then
    eval "$(pacman -S --needed git base-devel)"
    wait
    cd "$HOME/github"
    git clone https://aur.archlinux.org/yay.git
    wait
    cd "$HOME/github/yay"
    makepkg -si
    wait
fi

if ! command -v steam &>/dev/null; then
    eval "$(yay --sudoloop --noconfirm -S steam)"
    wait
fi

if ! command -v vesktop &>/dev/null; then
    eval "$(yay --sudoloop --noconfirm -S vesktop)"
    wait
fi

if ! -d "$HOME/.tmux/plugins/tpm"; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    wait
fi

if ! -d "$HOME/github/smooth-box/"; then
    cd "$HOME/github"
    git clone git@github.com:thatONEjustin/smooth-box.git
    wait
    cd $HOME/github/smooth-box
    stow --target="$HOME" --dir="$HOME/github/smooth-box" .
    wait
fi

# TODO: zsh-autosuggestions and zsh-syntax-highlighting plugins for ZSH
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# NOTE: p10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# if [! -d "$HOME/github/vinyl-theme" ]; then
#     eval "$(git clone https://github.com/ekaaty/vinyl-theme) $HOME/github"
#     wait
#     export NPROCS=$(grep -c proc /proc/cpuinfo)
#     cd $HOME/github/vinyl-theme/ && cmake -S . -B build
#     wait
#
#     cd $HOME/github/vinyl-theme/ && cmake --build build -j${NPROCS} --verbose
#     wait
#
#     # Install
#     export PREFIX=$([ $(id -u) -eq 0 ] && echo /usr || echo ~/.local)
#
#     cd vinyl-theme
#     cmake --install build --prefix ${PREFIX}
#     wait
# fi
