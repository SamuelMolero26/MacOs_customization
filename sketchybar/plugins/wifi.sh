#!/usr/bin/env sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F ' SSID : ' '/ SSID : /{print $2}')

if [ -z "$SSID" ]; then
  sketchybar --set wifi icon="$WIFI_DISCONNECTED" icon.color="$RED"
else
  sketchybar --set wifi icon="$WIFI_CONNECTED" icon.color="$GREEN"
fi
