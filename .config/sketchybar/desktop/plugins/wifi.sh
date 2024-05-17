#!/usr/bin/env zsh

update() {
  source "$CONFIG_DIR/icons.sh"
  ICON="$(echo "$WIFI_CONNECTED" || echo "$WIFI_DISCONNECTED")"

  sketchybar --set $NAME icon="$ICON"
}

click() {
  CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

  WIDTH=0
  if [ "$CURRENT_WIDTH" -eq "0" ]; then
    WIDTH=dynamic
  fi

  sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
}

case "$SENDER" in
  "wifi_change") update
  ;;
  "mouse.clicked") click
  ;;
esac
