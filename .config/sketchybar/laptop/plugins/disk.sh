#!/usr/bin/env zsh

sketchybar --set $NAME label="$(df -H | grep -E '^(/dev/disk3s1).' | awk '{ printf ("%s\n", $4) }' | sed 's/G$//'
)"
