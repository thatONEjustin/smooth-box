#!/bin/bash
# first_run.sh
#
# Working on my first install script!
#

personal_directories=("work" "github")

for i in "${personal_directories[@]}"; do
  if [ ! -d "$HOME/$i" ]; then
    mkdir -p $HOME/work
  fi
done

# if [ -d "$HOME/work" ]; then
#   mkdir -p $HOME/work
# fi
#
# if [ -d "$HOME/work" ]; then
#   mkdir -p $HOME/github
# fi
