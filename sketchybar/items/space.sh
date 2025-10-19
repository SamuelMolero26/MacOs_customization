#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"



SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
SPACES=()

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  SPACES+=(space.$sid)
  sketchybar --add space space.$sid left \
             --set space.$sid associated_space=$sid \
                              icon=${SPACE_ICONS[i]} \
                              icon.padding_left=20 \
                              icon.padding_right=20 \
                              icon.font="$FONT:Bold:15.0" \
                              icon.highlight_color=$ORANGE\
                              background.padding_left=3 \
                              background.padding_right=-3 \
                              background.color=$BACKGROUND_2\
                              background.highlight_color=$GREEN \
                              background.drawing=on \
                              label.drawing=on \
                                                  
done


