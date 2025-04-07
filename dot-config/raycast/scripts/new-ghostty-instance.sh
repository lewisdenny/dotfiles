#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New Ghostty Instance
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# open -a ghostty -n # Note: this creates a new instance of Ghostty -_-

osascript -e '
tell application "Ghostty"
	if it is running then
		activate
		tell application "System Events" to keystroke "n" using {command down}
	else
		activate
	end if
end tell
'
