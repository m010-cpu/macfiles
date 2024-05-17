#!/usr/bin/env zsh

brew=(
  label="?"
  icon=􀐛
  script="$PLUGIN_DIR/brew.sh"
)

cpu=(
  update_freq=60
  icon=$CPU
  script="$PLUGIN_DIR/cpu.sh"
)

disk=(
  update_freq=60
  icon=$DISK
  script="$PLUGIN_DIR/disk.sh"
)

status_bracket=(
  background.color=$NEO_DARK_BLUR
)

sketchybar --add event brew_update \
           --add item brew right   \
           --set brew "${brew[@]}" \
           --subscribe brew brew_update


sketchybar --add item cpu right       \
           --set cpu "${cpu[@]}" \
           --subscribe cpu system_woke

sketchybar --add item disk right       \
           --set disk "${disk[@]}" \
           --subscribe disk system_woke

sketchybar --add bracket status brew cpu disk \
           --set status "${status_bracket[@]}"
