#!/usr/bin/env bash

sketchybar --add item volume_percent right \
  --set volume_percent script="$PLUGIN_DIR/volume.sh" \
  --subscribe volume volume_change \
  --add item volume right \
  --set volume script="$PLUGIN_DIR/volume.sh" \
  --subscribe volume volume_change
