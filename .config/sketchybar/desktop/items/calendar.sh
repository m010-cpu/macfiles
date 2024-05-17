#!/usr/bin/env zsh

calendar=(
  label.font="$FONT:Regular:14.0"
  label.width=70
  icon.padding_right=8
  update_freq=1
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
