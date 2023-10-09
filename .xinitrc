#!/bin/sh

# Use ibus for Japanese IME.
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Assign the right AltGr key to keycode 108 (compose).
xmodmap -e "keycode 108 = Multi_key Alt_R Meta_R Alt_R Meta_R"

# Use inverted "natural" scrolling (swap mouse buttons 4 and 5).
xmodmap -e "pointer = 1 2 3 5 4 6 7 8 9 10 11 12"

# Turn caps lock into control.
xmodmap -e "clear lock"
xmodmap -e "clear control"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add control = Control_L Control_R"

exec /usr/local/bin/i3
