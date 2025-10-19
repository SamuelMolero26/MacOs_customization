#!/bin/bash

case "$SENDER" in
  front_app_switched|window_focus|window_created|window_destroyed|window_title_changed)
    # Check if the frontmost window is fullscreen
    fullscreen=$(yabai -m query --windows --window 2>/dev/null | jq -r '.["is-fullscreen"]')

    if [ "$fullscreen" = "true" ]; then
      sketchybar --bar hidden=on
    else
      sketchybar --bar hidden=off
    fi
    ;;
esac