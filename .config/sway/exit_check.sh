#!/bin/sh

# Use dmenu to check if the user wants to exit sway.

# If dmenu isn't installed, bail out immediately.
if [ ! -e /usr/local/bin/dmenu ]; then
  swaymsg exit
fi

# Work around dmenu crasher when XOpenIM() returns NULL.
# See: https://bugs.archlinux.org/task/61673
unset XMODIFIERS

while [ "$choice" != "no" ] && [ "$choice" != "yes" ]; do
  choice=$(echo -e 'no\nyes' | dmenu -fn "DejaVu Sans Mono-16" -p "Really exit?")
done
if [ "$choice" = "yes" ]; then
  swaymsg exit
fi
