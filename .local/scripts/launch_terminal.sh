#!/bin/bash

# ghostty

if tmux info &>/dev/null; then
    wezterm
else
    wezterm start -- $HOME/.local/scripts/tmux_attach.sh
fi
