#!/usr/bin/env zsh

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

sid=0
spaces=()
for i in "${(i)SPACE_ICONS[@]}";
do
  sid=$i

  space=(
    space=$sid
    icon=${SPACE_ICONS[i]}
    icon.padding_left=10
    icon.padding_right=10
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=$NEO_LIGHT_BLUE
    label.highlight_color=$WHITE
    label.font="sketchybar-app-font:Regular:14.0"
    label.y_offset=-1
    background.color=$NEO_DARK_BLUR
    background.border_color=$NEO_LIGHT_BLUE
    background.border_width=2

    label.background.color=$NEO_BASE0
    label.background.height=26
    label.background.corner_radius=7
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}"
done

separator=(
  icon=􀆊
  icon.font="$FONT:Heavy:17.0"
  script="$PLUGIN_DIR/space_windows.sh"
  padding_left=10
  padding_right=10
  label.drawing=off
  display=active
)

sketchybar --add item separator left          \
           --set separator "${separator[@]}"  \
           --subscribe separator space_windows_change
