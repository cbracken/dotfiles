# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

export EDITOR=/usr/bin/vim

if [ -n "$BASH_VERSION" ]; then
  # bash doesn't read .bashrc in login shells, do it manually
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# add to path if not already there
path_add() {
  [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"
}

# set PATH so it includes user's private bin if it exists
path_add "$HOME/bin"

# update PATH variable for use with MacPorts
path_add "/opt/local/sbin"
path_add "/opt/local/bin"
path_add "/opt/local/libexec/gnubin"

# login message
if [ -x /usr/games/fortune ]; then
  /usr/games/fortune
elif [ -x /opt/local/bin/fortune ]; then
  /opt/local/bin/fortune
fi
echo
