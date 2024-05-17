#!/usr/bin/env zsh

wifi=(
  icon="$WIFI_DISCONNECTED"
  script="$PLUGIN_DIR/wifi.sh"
)

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change mouse.clicked
