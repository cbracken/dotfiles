#!/bin/sh

# Use dmenu to check if the user wants to exit i3.

while [ "$choice" != "no" ] && [ "$choice" != "yes" ]; do
  choice=$(/bin/echo -e 'no\nyes' | dmenu -fn "DejaVu Sans Mono-16" -p "Really exit?")
done
if [ "$choice" = "yes" ]; then
  swaymsg exit
fi
