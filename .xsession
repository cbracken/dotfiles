#!/bin/sh

# Necessary to make chrome pick up the proxy settings stored in gconf.
export DESKTOP_SESSION=cinnamon

# NOTE: This may break your compose key.
# See http://g/i3-users/YBexXGbik7E for more details.
export GTK_IM_MODULE=xim

# Remap caps lock to ctrl.
if [[ -x "$(which setxkbmap)" ]]; then
  setxkbmap -option ctrl:nocaps
fi

# Desktop background color.
xsetroot -solid "#333333"

# Load .Xresources.
xrdb -load $HOME/.Xresources

# Launch i3.
exec i3
