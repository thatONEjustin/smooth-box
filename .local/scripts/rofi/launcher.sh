#!/bin/bash

rofi -config "$HOME/.config/rofi/launcher.rasi" \
    -m -5 \
    -show "combi" \
    --action copy --clipboarder wl-copy
