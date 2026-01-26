#!/bin/bash

tmux_script=$HOME/.local/scripts/tmux_attach.sh

if [ ! $(pgrep niri &>/dev/null) ]; then
    terminal=ghostty
    term_tmux="ghostty -e ${tmux_script}"
else
    terminal=wezterm
    term_tmux="wezterm start -- $HOME/.local/scripts/tmux_attach.sh"
fi

if [ ! $(tmux info &>/dev/null) ]; then
    ${terminal}
else
    ${term_tmux}
fi
