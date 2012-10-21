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

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# update PATH variable for use with MacPorts
[ -d /opt/local/sbin ] && PATH="/opt/local/sbin:$PATH"
[ -d /opt/local/bin ] && PATH="/opt/local/bin:$PATH"
[ -d /opt/local/libexec/gnubin ] && PATH="/opt/local/libexec/gnubin:$PATH"

# login message
if [ -x `which fortune` ]; then
  fortune
  echo ""
fi
