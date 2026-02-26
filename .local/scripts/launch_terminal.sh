#!/bin/bash

tmux_script=$HOME/.local/scripts/tmux_attach.sh

terminal=wezterm
term_tmux="wezterm start -- ${tmux_script}"

# NOTE: for now we don't really need this
# I like ghostty and originally wezterm wasn't
# running on niri but now it looks good
#
# if [ ! $(pgrep niri &>/dev/null) ]; then
#     terminal=ghostty
#     term_tmux="ghostty -e ${tmux_script}"
# else
#     terminal=wezterm
#     term_tmux="wezterm start -- ${tmux_script}"
# fi

if tmux info &>/dev/null; then
    ${terminal}
else
    ${term_tmux}
fi
