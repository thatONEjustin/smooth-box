#!/bin/bash

swayidle -w \
    timeout 900 '$HOME/.local/scripts/gtklock.sh' \
    timeout 3600 'systemctl suspend'
