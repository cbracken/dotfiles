# .zshenv

# Default read-only permissions for group/other.
umask 022

# Basics
export EDITOR=vim
export PAGER=less

# Set language to Australian English, currency to Japanese Yen.
export LANG=en_AU.UTF-8
export LANGUAGE=en_AU.UTF-8
export LC_COLLATE=en_AU.UTF-8
export LC_CTYPE=en_AU.UTF-8
export LC_MESSAGES=en_AU.UTF-8
export LC_MONETARY=ja_JP.UTF-8
export LC_NUMERIC=en_AU.UTF-8
export LC_TIME=en_AU.UTF-8

# GPG directory and TTY used for pinentry.
export GNUPGHOME="$HOME/.gnupg"
export GPG_TTY="$(tty)"

# Notmuch email indexer.
export NOTMUCH_CONFIG="$HOME/.config/notmuch/config"

# Google stuff.
export P4CONFIG=.p4config
export P4EDITOR=vim
export GEM_HOME="$HOME/.gem"

# If a local python3 directory exists, add PYTHONPATH.
if [[ -d "$HOME/.local/lib/python3" ]]; then
  export PYTHONPATH="$HOME/.local/lib/python3:$PYTHONPATH"
fi

# If a local perl5 directory exists, add PERL5LIB.
if [[ -d "$HOME/.perl5/lib/perl5" ]]; then
  export PERL5LIB="$HOME/.perl5/lib/perl5:$PERL5LIB"
fi

# When not running under a FreeDesktop-compliant session manager, set
# XDG_RUNTIME_DIR for programs (e.g. sway) that need it.
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR="/tmp/user/$(id -u)"
  mkdir -p "$XDG_RUNTIME_DIR"
  chmod 0700 "$XDG_RUNTIME_DIR"
fi
