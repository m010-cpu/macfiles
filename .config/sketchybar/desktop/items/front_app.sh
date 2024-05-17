#!/usr/bin/env zsh

front_app=(
  label.font="$FONT:Bold:12.0"
  icon.drawing=off
  display=active
  padding_left=0
  script="$PLUGIN_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
