#!/bin/bash

# Raycast Script Command Template
#
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New iTerm Window
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

osascript -e 'tell application "iTerm"'           \
          -e 'create window with default Profile' \
          -e 'activate'                           \
          -e 'end tell'
