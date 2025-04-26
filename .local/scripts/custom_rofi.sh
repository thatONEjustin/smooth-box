#!/bin/bash

if [[ $1 == "start" ]]; then
    rofi -config "$HOME/.config/rofi/start-menu.rasi" -show drun -click-to-exit &
else
    rofi -config "$HOME/.config/rofi/launcher.rasi" -m -5 -mode calc -combi-modes "drun,window,emoji:rofimoji" -mode combi -modes "combi,calc,filebrowser" -show combi -display-combi " " -display-calc " " -display-filebrowser "󱧶 " &
fi
