#!/bin/bash

if [ -z "$TMUX" ]; then
    tmux attach || tmux
fi
