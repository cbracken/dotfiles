#!/bin/sh

# Use wofi to check if the user wants to exit sway.

# If wofi isn't installed, bail out immediately.
if ! which wofi; then
  swaymsg exit
fi

while [ "$choice" != "no" ] && [ "$choice" != "yes" ]; do
  choice=$(printf 'no\nyes\n' | wofi --show dmenu -p "Really exit?")
done
if [ "$choice" = "yes" ]; then
  swaymsg exit
fi
