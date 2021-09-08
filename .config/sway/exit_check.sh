#!/bin/sh

# Use wofi to check if the user wants to exit sway.

# If wofi isn't installed, bail out immediately.
which wofi
if [ $? != 0 ]; then
  swaymsg exit
fi

while [ "$choice" != "no" ] && [ "$choice" != "yes" ]; do
  choice=$(echo -e 'no\nyes' | wofi --show dmenu -p "Really exit?")
done
if [ "$choice" = "yes" ]; then
  swaymsg exit
fi
