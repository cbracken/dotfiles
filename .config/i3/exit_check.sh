#!/bin/sh

# Use dmenu to check if the user wants to exit i3.

# Work around dmenu crasher when XOpenIM() returns NULL.
# See: https://bugs.archlinux.com/task/61673
unset XMODIFIERS

while [ "$choice" != "no" ] && [ "$choice" != "yes" ]; do
  choice=$(echo -e 'no\nyes' | dmenu -fn "DejaVu Sans Mono-12" -p "Really exit?")
done
if [ "$choice" = "yes" ]; then
  i3-msg exit
fi
