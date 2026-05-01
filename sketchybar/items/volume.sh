#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

volume_icon=(
  script="$PLUGIN_DIR/volume_click.sh"
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=10
  icon=$VOLUME_100
  icon.color=$GREY
  icon.font="$FONT:Regular:14.0"
  label.drawing=off
)

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$BLUE
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$BACKGROUND_2
  slider.knob=􀀁
  slider.knob.drawing=on
  slider.width=100
  width=150
)

sketchybar --add item volume_icon right              \
           --set volume_icon "${volume_icon[@]}"     \
           --subscribe volume_icon mouse.scrolled    \
                                                     \
           --add slider volume popup.volume_icon     \
           --set volume "${volume_slider[@]}"        \
           --subscribe volume volume_change          \
                              mouse.clicked
