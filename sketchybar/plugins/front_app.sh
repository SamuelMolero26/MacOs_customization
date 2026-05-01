#!/bin/bash

if [ "$SENDER" = "front_app_switched" ]; then
  # Set the app name and app icon and then animate a bounce for the icon size
  sketchybar --set $NAME label="$INFO" \
             icon.background.image="app.$INFO" \
             icon.background.image.scale=0.8 \
             icon.background.border_width=2 \
             icon.background.border_color=0xffeed49f
fi