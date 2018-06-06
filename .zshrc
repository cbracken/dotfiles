# .zshrc

# Environment vars
export EDITOR=/usr/bin/vim
export GNUPGHOME="$HOME/.gnupg"
export GOMA_DIR="$HOME/src/goma"
export GPG_TTY="$(tty)"
export GREP_OPTIONS="--color=auto"

# P4 config
export P4CONFIG=.p4config
export P4EDITOR=vim

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Write history command-by-command, don't overwrite.
setopt INC_APPEND_HISTORY

# Treat '#', '~', and '^' as part of patte4rns for filename generation.
setopt EXTENDED_GLOB

# vi-mode
bindkey -v
bindkey '^Y' push-line
bindkey '^R' history-incremental-search-backward

# Completion
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# The Dart VM conflates echo (echo typed characters) and echonl (echo
# newlines). Until fixed, turn off echonl after every command.
#
# See: https://github.com/dart-lang/sdk/issues/30318
precmd() {
  stty -echonl
}

# Current git branch (for prompt)
git_branch() {
  local branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  if [[ -n $branch ]]; then
    echo -n " ($branch)"
  fi
}

# Prompt
setopt prompt_subst
autoload -Uz colors && colors
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  PROMPT='%{$fg[yellow]%}%T %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%c%{$fg[yellow]%}$(git_branch)%{$reset_color%}%# '
else
  PROMPT="%T %n@%m:%c$(git_branch)%# "
fi

# If procfs is available, get the terminal executable.
term_bin=""
if [[ -e /proc/$PPID/cmdline ]]; then
  term_bin="${$(</proc/$PPID/cmdline):t}"
fi

# Set TERM for known terminals, and as a fallback when specified term is
# unavailable.
if [[ "$COLORTERM" == "gnome-terminal" ]] || \
   [[ "$term_bin" == gnome-terminal* ]] || \
   [[ "$term_bin" == urxvt* ]] || \
   [[ "$TERM" == "xterm-256color-italic" && ! $(tput -T$TERM longname > /dev/null 2>&1) ]]; then
  export TERM=xterm-256color
fi
unset term_bin

# Load path additions.
if [ -f ~/.paths ]; then
  . ~/.paths
fi

# Load aliases.
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# Load colour support.
if [ -f ~/.colors ]; then
  . ~/.colors
fi

# Load custom functions.
if [ -f ~/.sh_functions ]; then
  . ~/.sh_functions
fi

# Load tools.
if [ -f ~/.tools ]; then
  . ~/.tools
fi
