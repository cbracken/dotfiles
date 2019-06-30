# .zshrc

# Environment vars.
export EDITOR=vim
export GNUPGHOME="$HOME/.gnupg"
export GOMA_DIR="$HOME/src/goma"
export GEM_HOME="$HOME/.gem"

# Set tty used for GPG pinentry.
GPG_TTY="$(tty)"
export GPG_TTY

# P4 config.
export P4CONFIG=.p4config
export P4EDITOR=vim

# History.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Write history command-by-command, don't overwrite.
setopt INC_APPEND_HISTORY

# Treat '#', '~', and '^' as part of patterns for filename generation.
setopt EXTENDED_GLOB

# vi-mode.
bindkey -v
bindkey '^Y' push-line
bindkey '^R' history-incremental-search-backward

# Completion.
if [[ "$(uname -s)" == "Darwin" ]]; then
  fpath=($HOME/.homebrew/share/zsh/site-functions $fpath)
fi
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Current git branch (for prompt).
git_branch() {
  local branch
  branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  if [[ -n $branch ]]; then
    echo -n " ($branch)"
  fi
}

# Prompt.
setopt prompt_subst
autoload -Uz colors && colors
PROMPT='%{$fg[yellow]%}%T %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%c%{$fg[yellow]%}$(git_branch)%{$reset_color%}%# '

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
   [[ "$TERM" == "xterm-256color-italic" && ! $(tput -T"$TERM" longname > /dev/null 2>&1) ]]; then
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
