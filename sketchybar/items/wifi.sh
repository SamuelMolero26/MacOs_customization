#!/bin/bash

source "$CONFIG_DIR/icons.sh"

source "$CONFIG_DIR/colors.sh"



sketchybar --add item net right \
           --set net script="$PLUGIN_DIR/net.sh" \
                     icon.drawing=off \
                     background.padding_left=0  \
                     update_freq=90 \
                     padding_right=-10

sketchybar --add item net_logo right \
           --set net_logo icon="$WIFI_DISCONNECTED"\
                     icon.color="$WHITE"\
                     label.drawing=off \
                    