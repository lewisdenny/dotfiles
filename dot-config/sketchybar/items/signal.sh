#!/usr/bin/env bash

sketchybar --add item signal "$1" \
  --set signal \
  update_freq=10 \
  script="$PLUGIN_DIR/signal.sh" \
  background.padding_left=15 \
  icon.font.size=15 \
  label.font.size=15 \
  click_script="open -a 'Signal'" \
  --subscribe signal system_woke
