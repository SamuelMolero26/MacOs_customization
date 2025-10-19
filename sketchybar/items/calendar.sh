#!/bin/bash

calendar=(
  icon.font="$FONT:Black:12.0"
  icon.padding_right=4
  label.width=40
  label.align=right
  label.font="$FONT:Black:12.0"
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke