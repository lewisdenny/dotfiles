#!/usr/bin/env bash

aerospace_current=$(aerospace list-workspaces --focused)

aerospace_set=(
  # background.color=0x44ffffff
  # background.corner_radius=5
  # background.height=20
  # background.drawing=off
  label="$aerospace_current"
  script="$CONFIG_DIR/plugins/aerospace.sh $sid"
)

sketchybar --add event aerospace_workspace_change

sketchybar --add item aerospace_workspace left \
  --subscribe aerospace_workspace aerospace_workspace_change \
  --set aerospace_workspace "${aerospace_set[@]}"
