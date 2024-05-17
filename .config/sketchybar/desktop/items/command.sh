#!/usr/bin/env zsh

command_logo=(
  background.color=$NEO_LIGHT_BLUE
  background.corner_radius=6
  background.height=26
  icon=$CMD
  icon.padding_left=7
  icon.padding_right=7
  icon.font.size=20
  icon.highlight=on
  label.drawing=off
  click_script="sketchybar -m --set \$NAME popup.drawing=toggle"
  popup.height=32
  popup.background.color=$NEO_DARK_BLUR
  popup.blur_radius=30
  popup.background.border_width=2
  popup.background.corner_radius=12
  popup.background.border_color=$NEO_LIGHT_BLUE
)

command_preferences=(
  icon=$COG
  icon.color=$NEO_LIGHT_BLUE
  icon.padding_left=4
  icon.padding_right=2
  label="Settings"
  label.padding_left=2
  label.padding_right=4
  click_script="open -a 'System Preferences'; sketchybar -m --set command.logo popup.drawing=off"
)

command_activity=(
  icon=$CHART
  icon.color=$NEO_LIGHT_BLUE
  icon.padding_left=4
  icon.padding_right=2
  label="Activity"
  label.padding_left=2
  label.padding_right=4
  click_script="open -a 'Activity Monitor'; sketchybar -m --set command.logo popup.drawing=off"
)

command_lock=(
  icon=$LOCK
  icon.color=$NEO_LIGHT_BLUE
  icon.padding_left=4
  icon.padding_right=2
  label="Lock"
  label.padding_left=2
  label.padding_right=4
  click_script="pmset displaysleepnow; sketchybar -m --set command.logo popup.drawing=off"
)

command_bracket=(
  background.height=26
  background.width=26
  background.color=$NEO_DARK_BLUR
  background.border_width=1
  background.border_color=$NEO_LIGHT_BLUE
)

sketchybar --add item command.logo left \
           --set command.logo "${command_logo[@]}" \

sketchybar --add item command.preferences popup.command.logo \
           --set command.preferences "${command_preferences[@]}" \

sketchybar --add item command.activity popup.command.logo \
           --set command.activity "${command_activity[@]}" \

sketchybar --add item command.lock popup.command.logo \
           --set command.lock "${command_lock[@]}" \

# sketchybar --add bracket command.bracket command.logo \
#            --set command.bracket "${command_bracket[@]}" \ 
