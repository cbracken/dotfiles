# .zshrc

# History.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Write history command-by-command, don't overwrite.
setopt INC_APPEND_HISTORY

# Treat '#', '~', and '^' as part of patterns for filename generation.
setopt EXTENDED_GLOB

# Increase open file descriptor, per-user process limits for Goma builds.
# On Linux, set via ulimit. For macOS, follow the procedures at http://go/ma.
if [ $(uname) = Linux ]; then
  # Bump up max open file descriptors and processes.
  ulimit -n 32768
  ulimit -u 32768
fi

# vi-mode.
bindkey -v
bindkey '^Y' push-line
bindkey '^R' history-incremental-search-backward

# Add zsh completion definition dirs.
fpath=($HOME/.local/zsh/site-functions $fpath)

# Specify where compinstall writes cfg commands. Default, but saves checks.
zstyle ':compinstall' filename "$HOME/.zshrc"

# Use menu-style autocompletion.
zstyle ':completion:*' menu select

# Initialize completion for current session.
autoload -Uz compinit && compinit

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

# Set TERM for known terminals, and as a fallback when specified term is
# unavailable.
term_bin=""
if [[ -e /proc/$PPID/cmdline ]]; then
  term_bin="${$(</proc/$PPID/cmdline):t}"
fi
if [[ "$COLORTERM" == "gnome-terminal" ]] || \
   [[ "$term_bin" == gnome-terminal* ]] || \
   [[ "$TERM" == "xterm-256color-italic" && ! $(tput -T"$TERM" longname > /dev/null 2>&1) ]]; then
  export TERM=xterm-256color
fi
unset term_bin

# g4d support
if [[ -f "/etc/bash_completion.d/g4d" ]]; then
  source /etc/bash_completion.d/g4d
fi

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
