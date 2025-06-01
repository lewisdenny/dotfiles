#!/usr/bin/env bash

sketchybar --add item date_icon "$1" \
  --set date_icon icon= \
  icon.padding_right=8 \
  icon.padding_left=8 \
  icon.color=0xff121219 \
  icon.font.size=25 \
  label.drawing=off \
  background.color=0xff92B3F5 \
  --add item day "$1" \
  --add item date "$1" \
  --add item month "$1" \
  --set day update_freq=10 padding_right=4 script="$PLUGIN_DIR/date.sh"
