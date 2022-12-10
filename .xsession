# Use ibus for Japanese IME.
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GDK_SCALE=2

exec /usr/local/bin/i3
