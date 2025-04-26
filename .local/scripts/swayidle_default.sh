#!/bin/bash

swayidle -w \
    timeout 900 '$HOME/.local/scripts/swaylock_default.sh' \
    timeout 3600 'systemctl suspend'
