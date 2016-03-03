# Remap caps lock to ctrl
if [[ -x "$(which setxkbmap)" ]]; then
  setxkbmap -option ctrl:nocaps
fi

xrdb -load $HOME/.Xresources
/usr/local/bin/i3
