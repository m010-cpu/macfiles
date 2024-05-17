#!/usr/bin/env zsh

battery=(
  icon.padding_left=7
  update_freq=60
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right       \
           --set battery "${battery[@]}" \
           --subscribe battery system_woke
