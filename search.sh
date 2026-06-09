#!/bin/bash
# Copy the selected word to clipboard
echo -n "$POPCLIP_TEXT" | pbcopy

# Open LookUp
open -a "LookUp"
sleep 1

# Activate LookUp, focus the search bar, paste the word, and press Enter
osascript \
  -e 'tell application "LookUp" to activate' \
  -e 'delay 0.5' \
  -e 'tell application "System Events" to tell process "LookUp" to keystroke "f" using {command down}' \
  -e 'delay 0.3' \
  -e 'tell application "System Events" to keystroke "v" using {command down}' \
  -e 'delay 0.1' \
  -e 'tell application "System Events" to key code 36'
