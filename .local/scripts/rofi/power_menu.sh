#!/usr/bin/env sh
#
# A rofi powered menu to execute power related action.
# Uses: amixer mpc poweroff reboot rofi rofi-prompt

power_off=' '
reboot=' '
lock=' '
suspend='󰒲 '
log_out=' '

chosen=$(printf '%s;%s;%s;%s;%s\n' "$power_off" "$reboot" "$lock" "$suspend" \
    "$log_out" |
    rofi -theme-str '@import "~/.config/rofi/power.rasi"' \
        -dmenu \
        -sep ';' \
        -selected-row 2)

case "$chosen" in
"$power_off")
    rofi-prompt --query 'Shutdown?' && poweroff
    ;;

"$reboot")
    rofi-prompt --query 'Reboot?' && reboot
    ;;

"$lock")
    # TODO Add your lockscreen command.
    $HOME/.local/scripts/gtklock.sh
    ;;

"$suspend")
    # Pause music and mute volume before suspending.
    # mpc --quiet pause
    # amixer set Master mute
    # TODO Add your suspend command.
    systemctl suspend
    ;;

"$log_out")
    # TODO Add your log out command.
    hyprctl dispatch exit
    ;;

*) exit 1 ;;
esac
