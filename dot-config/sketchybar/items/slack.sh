#!/usr/bin/env bash

sketchybar --add item slack "$1" \
  --set slack \
  update_freq=10 \
  script="$PLUGIN_DIR/slack.sh" \
  background.padding_left=15 \
  icon.font.size=15 \
  label.font.size=15 \
  click_script="open -a 'Slack'" \
  --subscribe slack system_woke
