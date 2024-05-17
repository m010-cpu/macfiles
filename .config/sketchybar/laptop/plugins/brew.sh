#!/usr/bin/env zsh

source "$CONFIG_DIR/colors.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$NEO_LIGHT_BLUE

case "$COUNT" in
  [3-5][0-9]) COLOR=$NEO_RED
  ;;
  [1-2][0-9]) COLOR=$NEO_ORANGE
  ;;
  [1-9]) COLOR=$NEO_YELLOW
  ;;
  0) COLOR=$NEO_GREEN
     # COUNT=􀆅
  ;;
esac

sketchybar --set $NAME icon.color=$COLOR label=$COUNT
