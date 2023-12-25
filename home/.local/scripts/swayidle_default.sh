#!/bin/bash

swayidle -w \
    timeout 600 '$smooth/home/scripts/swaylock_default.sh' \ 
    timeout 900 'systemctl suspend' 
