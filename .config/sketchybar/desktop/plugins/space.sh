#!/usr/bin/env zsh

source "$CONFIG_DIR/colors.sh"

COLOR=$NEO_BASE0
if [ "$SELECTED" = "true" ]; then
  COLOR=$NEO_LIGHT_BLUE
fi
sketchybar --set $NAME icon.highlight=$SELECTED \
                       label.highlight=$SELECTED \
                       label.background.color=$COLOR \
                       background.border_color=$COLOR
