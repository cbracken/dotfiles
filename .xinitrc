# Remap caps lock to ctrl.
if [[ -x "$(which setxkbmap)" ]]; then
  setxkbmap jp
  setxkbmap -option ctrl:nocaps
fi

# Set the context-menu key to Zenkaku/Hankaku.
if [[ -x "$(which xmodmap)" ]]; then
  xmodmap -e "keysym Menu = Zenkaku_Hankaku"
fi

# Use ibus for Japanese IME.
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=xim
export XMODIFIERS=@im=fcitx

/usr/local/bin/mozc start
fcitx -r -d

xrdb -load $HOME/.Xresources
/usr/local/bin/i3
