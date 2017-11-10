# .zlogin

# On Linux, run gnome keyring.
if [[ -x "$(which gnome-keyring-daemon)" ]]; then
  export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
fi

# Output login message.
if [ -x "/usr/games/fortune" ]; then
  /usr/games/fortune
  echo
elif [ -x "/opt/local/bin/fortune" ]; then
  /opt/local/bin/fortune
  echo
elif [ -x "$HOME/.homebrew/bin/fortune" ]; then
  "$HOME/.homebrew/bin/fortune"
  echo
fi
