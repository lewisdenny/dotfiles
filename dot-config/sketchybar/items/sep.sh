#!/usr/bin/env bash

sep_set=(
  label="⸻"
  padding_left="14"
  padding_right="14"
  icon.drawing=off
  label.font.size=14.0
  label.color="$WHITE"
)

sepName="sep$RANDOM"
sketchybar \
  --add item "$sepName" "$1" \
  --set "$sepName" "${sep_set[@]}"
