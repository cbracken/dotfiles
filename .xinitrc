# Use ibus for Japanese IME.
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# Start ibus daemon.
ibus-daemon --xim &

/usr/local/bin/i3
