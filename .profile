# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

export EDITOR=/usr/bin/vim
export GNUPGHOME="$HOME/.gnupg"
export DART_SDK="/usr/lib/dart"
export TERMINAL=urxvt

# gnome keyring
if [[ $(which gnome-keyring-daemon) == 0 ]]; then
  export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
fi

if [ -n "$BASH_VERSION" ]; then
  # bash doesn't read .bashrc in login shells, do it manually
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# Remap caps lock to ctrl
if [[ "$(uname)" != "Darwin" && -n "$DISPLAY" && -x "$(which setxkbmap)" ]]
then
  setxkbmap -option ctrl:nocaps
fi

# login message
if [ -x "/usr/games/fortune" ]; then
  /usr/games/fortune
elif [ -x "/opt/local/bin/fortune" ]; then
  /opt/local/bin/fortune
fi
echo
