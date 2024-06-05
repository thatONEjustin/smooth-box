#!/bin/bash

swayidle -w \
	timeout 1800 'systemctl suspend'
# timeout 900 '$HOME/.local/scripts/swaylock_default.sh' \
