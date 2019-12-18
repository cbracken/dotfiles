#!/bin/sh

# Use dmenu to check if the user wants to exit i3.

while [ "$choice" != "no" -a "$choice" != "yes" ]; do
  choice=$(echo -e 'no\nyes' | dmenu -p "Really exit?")
done
if [ "$choice" == "yes" ]; then
  swaymsg exit
fi
