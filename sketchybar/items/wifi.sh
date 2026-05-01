#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

sketchybar --add item wifi right \
           --set wifi script="$PLUGIN_DIR/wifi.sh" \
                     icon="$WIFI_DISCONNECTED" \
                     icon.font="SF Pro:Regular:14.0" \
                     icon.color="$WHITE" \
                     label.drawing=off \
                     update_freq=10
