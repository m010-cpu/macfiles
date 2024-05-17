#!/usr/bin/env zsh

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set $NAME label="$INFO" \
             --animate tanh 10 --set $NAME
fi
