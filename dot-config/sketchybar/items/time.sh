#!/usr/bin/env bash

sketchybar --add item clock_icon "$1" \
  --set clock_icon icon=󰥔 \
  icon.padding_right=8 \
  icon.padding_left=8 \
  icon.color=0xff121219 \
  icon.font.size=25 \
  label.drawing=off \
  background.color=0xff92B3F5 \
  --add item clock "$1" \
  --set clock update_freq=10 align="centre" script="$PLUGIN_DIR/clock.sh"
