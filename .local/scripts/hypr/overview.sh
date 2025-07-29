#!/bin/bash

hyprctl dispatch exec "[workspace special:overview silent] foot --hold --config=$HOME/.config/foot/hyfetch.ini --title=foot-overview-fetch hyfetch" &
sleep 2

hyprctl dispatch exec "[workspace special:overview silent] foot --config=$HOME/.config/foot/task-manager.ini --title=foot-overview btop" &
sleep 2

hyprctl dispatch exec "[workspace special:overview silent] foot --config=$HOME/.config/foot/drop-terminal.ini --title=foot-overview-term" &
sleep 2
