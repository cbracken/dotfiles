# Remap caps lock to ctrl.
if [[ -x "$(which setxkbmap)" ]]; then
  setxkbmap -option ctrl:nocaps
fi

# Set the context-menu key to Zenkaku/Hankaku.
if [[ -x "$(which xmodmap)" ]]; then
  xmodmap -e "keysym Menu = Zenkaku_Hankaku"
fi

# Use ibus for Japanese IME.
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

xrdb -load $HOME/.Xresources
/usr/local/bin/i3
