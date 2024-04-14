#!/bin/bash

swayidle -w \
	timeout 600 '$HOME/.local/scripts/swaylock_default.sh' \
	timeout 900 'systemctl suspend'
