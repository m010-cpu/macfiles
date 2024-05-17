#!/usr/bin/env zsh

yabai=(
  script="$PLUGIN_DIR/yabai.sh"
  icon.font="$FONT:Bold:16.0"
  label.drawing=off
  icon.width=30
  icon=$YABAI_GRID
  icon.color=$NEO_ORANGE
  associated_display=active
  updates=on
)

sketchybar --add event window_focus            \
           --add item yabai left               \
           --set yabai "${yabai[@]}"           \
           --subscribe yabai window_focus      \
                             mouse.clicked
