#!/usr/bin/env zsh

network=(
  icon="$WIFI_DISCONNECTED"
  click_script="sketchybar -m --set \$NAME popup.drawing=toggle"
  popup.height=32
  popup.background.color=$NEO_DARK_BLUR
  popup.blur_radius=30
  popup.background.border_width=2
  popup.background.corner_radius=12
  popup.background.border_color=$NEO_LIGHT_BLUE
)

sketchybar --add item network right \
           --set network "${network[@]}" \
           --subscribe network network_change mouse.clicked


network_ssid=(
  icon=$COG
  icon.color=$NEO_LIGHT_BLUE
  icon.padding_left=4
  icon.padding_right=2
  label="Settings"
  label.padding_left=2
  label.padding_right=4
  click_script="open -a 'System Preferences'; sketchybar -m --set network popup.drawing=off"
)
#
# command_activity=(
#   icon=$CHART
#   icon.color=$NEO_LIGHT_BLUE
#   icon.padding_left=4
#   icon.padding_right=2
#   label="Activity"
#   label.padding_left=2
#   label.padding_right=4
#   click_script="open -a 'Activity Monitor'; sketchybar -m --set command.logo popup.drawing=off"
# )
#
# command_lock=(
#   icon=$LOCK
#   icon.color=$NEO_LIGHT_BLUE
#   icon.padding_left=4
#   icon.padding_right=2
#   label="Lock"
#   label.padding_left=2
#   label.padding_right=4
#   click_script="pmset displaysleepnow; sketchybar -m --set command.logo popup.drawing=off"
# )
#
# command_power=(
#   icon=$POWER
#   icon.color=$NEO_LIGHT_BLUE
#   icon.padding_left=4
#   icon.padding_right=2
#   label="Power"
#   label.padding_left=2
#   label.padding_right=4
#   click_script="pmset displaysleepnow; sketchybar -m --set command.logo popup.drawing=off"
# )
#
# command_bracket=(
#   background.height=26
#   background.width=26
#   background.color=$NEO_DARK_BLUR
#   background.border_width=1
#   background.border_color=$NEO_LIGHT_BLUE
# )

# sketchybar --add item command.logo left \
#            --set command.logo "${command_logo[@]}" \
#
sketchybar --add item network.ssid popup.network \
           --set network.ssid "${network_ssid[@]}" \
#
# sketchybar --add item command.activity popup.command.logo \
#            --set command.activity "${command_activity[@]}" \
#
# sketchybar --add item command.lock popup.command.logo \
#            --set command.lock "${command_lock[@]}" \
#
# sketchybar --add item command.power popup.command.logo \
#            --set command.power "${command_power[@]}" \
