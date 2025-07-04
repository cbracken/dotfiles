# .zshenv
#
# Despite setting ZDOTDIR, this file will likely need to be symlinked to
# ~/.zshenv, unless the OS itself defaults ZDOTDIR to the specified location.

# Default read-only permissions for group/other.
umask 022

# If not running under a FreeDesktop session manager, set XDG variables.
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi
if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="$HOME/.cache"
fi
if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
fi
if [[ -z "$XDG_STATE_HOME" ]]; then
  export XDG_STATE_HOME="$HOME/.local/state"
fi
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR="/tmp/user/$(id -u)"
  mkdir -p "$XDG_RUNTIME_DIR"
  chmod 0700 "$XDG_RUNTIME_DIR"
fi

# Set location for remainder of zsh config files to avoid cluttering $HOME.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Basics
export EDITOR=nvim
export PAGER=less
export LESS="-FRX"

# Set language, date/time, currency, etc. to Japanese.
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8
export LC_MONETARY=ja_JP.UTF-8
export LC_NUMERIC=ja_JP.UTF-8
export LC_PAPER=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8

# GPG directory and TTY used for pinentry.
export GNUPGHOME="$HOME/.gnupg"
export GPG_TTY="$(tty)"

# Lynx browser.
export LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"

# Notmuch email indexer.
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/config"

# Google stuff.
export P4CONFIG=.p4config
export P4EDITOR=nvim
export GEM_HOME="$HOME/.gem"

# Platform-specific source directory.
[[ -d "$HOME/src" ]] && SRC_ROOT="$HOME/src"
[[ -d "$HOME/Developer" ]] && SRC_ROOT="$HOME/Developer"

# Set GOPATH.
export GOPATH="$SRC_ROOT/go"

# If a local python3 directory exists, add PYTHONPATH.
if [[ -d "$HOME/.local/lib/python3" ]]; then
  export PYTHONPATH="$HOME/.local/lib/python3:$PYTHONPATH"
fi

# If a local perl5 directory exists, add PERL5LIB.
if [[ -d "$HOME/.perl5/lib/perl5" ]]; then
  export PERL5LIB="$HOME/.perl5/lib/perl5:$PERL5LIB"
fi
