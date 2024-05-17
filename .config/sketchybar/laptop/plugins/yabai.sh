#!/usr/bin/env zsh

window_state() {
  source "$CONFIG_DIR/colors.sh"
  source "$CONFIG_DIR/icons.sh"

  WINDOW=$(yabai -m query --windows --window)
  CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

  args=()
  if [[ $CURRENT -gt 0 ]]; then
    LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    args+=(--set $NAME icon=$YABAI_STACK icon.color=$NEO_RED label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))

  else
    args+=(--set $NAME label.drawing=off)
    case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
      "false")
        if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_FULLSCREEN_ZOOM icon.color=$NEO_GREEN)
        elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_PARENT_ZOOM icon.color=$NEO_LIGHT_BLUE)
        else
          args+=(--set $NAME icon=$YABAI_GRID icon.color=$NEO_ORANGE)
        fi
        ;;
      "true")
        args+=(--set $NAME icon=$YABAI_FLOAT icon.color=$NEO_VIOLET)
        ;;
    esac
  fi

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  yabai -m window --toggle float
  window_state
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "window_focus") window_state 
  ;;
esac
