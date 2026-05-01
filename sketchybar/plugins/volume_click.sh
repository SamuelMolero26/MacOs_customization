#!/bin/bash

scroll_volume() {
  CURRENT=$(osascript -e "output volume of (get volume settings)")
  NEW_VOL=$((CURRENT + SCROLL_DELTA * 5))
  if [ "$NEW_VOL" -gt 100 ]; then NEW_VOL=100; fi
  if [ "$NEW_VOL" -lt 0 ]; then NEW_VOL=0; fi
  osascript -e "set volume output volume $NEW_VOL"
}

toggle_popup() {
  sketchybar --set volume_icon popup.drawing=toggle
}

case "$SENDER" in
  "mouse.scrolled") scroll_volume ;;
  *) toggle_popup ;;
esac
