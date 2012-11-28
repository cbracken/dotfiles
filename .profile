# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

export EDITOR=/usr/bin/vim
export GNUPGHOME=/Volumes/Personal/.gnupg

if [ -n "$BASH_VERSION" ]; then
  # bash doesn't read .bashrc in login shells, do it manually
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# start gpg-agent
if [ -f "$HOME/.gpg-agent-info" ] && kill -0 `cut -d: -f 2 "$HOME/.gpg-agent-info"` 2>/dev/null; then
  . "$HOME/.gpg-agent-info"
  export GPG_AGENT_INFO
elif [ -x /opt/local/bin/gpg-agent ]; then
  eval $(/opt/local/bin/gpg-agent --daemon --write-env-file "$HOME/.gpg-agent-info")
fi

# login message
if [ -x /usr/games/fortune ]; then
  /usr/games/fortune
elif [ -x /opt/local/bin/fortune ]; then
  /opt/local/bin/fortune
fi
echo
