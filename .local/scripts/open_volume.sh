#!/bin/bash

if [[ $(pgrep -f pavucontrol) ]]; then
    killall -9 pavucontrol
else
    pavucontrol &
fi
