#!/usr/bin/env bash

sketchybar --set day \
  icon.drawing=off \
  padding_right=2 \
  label="$(date '+%a')" \
  --set date \
  icon.drawing=off \
  padding_right=2 \
  label="$(date '+%d' | sed s/^0//)" \
  --set month \
  icon.drawing=off \
  padding_right=2 \
  label="$(date '+%b')"
