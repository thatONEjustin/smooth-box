#!/bin/bash

if [[ $1 == "start" ]]; then
    rofi -config "$HOME/.config/rofi/start-menu.rasi" -show drun -click-to-exit &
else
    rofi -config "$HOME/.config/rofi/launcher.rasi" -m -5 -show "combi" --action copy --clipboarder wl-copy
fi
