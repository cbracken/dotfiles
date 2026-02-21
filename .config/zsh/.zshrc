# .zshrc

# History.
[[ ! -d "$XDG_CACHE_HOME/zsh" ]] && mkdir -p "$XDG_CACHE_HOME/zsh"
HISTFILE="$XDG_CACHE_HOME/zsh/zsh_histfile"
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

# Add zsh completion definition dirs.
if [ -d ".homebrew/share/zsh/site-functions" ]; then
  fpath=("$HOME/.homebrew/share/zsh/site-functions" "${fpath[@]}")
fi
fpath=("$HOME/.local/zsh/site-functions" "$ZDOTDIR/site-functions" "${fpath[@]}")

# Specify where compinstall writes cfg commands. Default, but saves checks.
zstyle ':compinstall' filename "$ZDOTDIR/.zshrc"

# Use menu-style autocompletion.
zstyle ':completion:*' menu select

# Initialize completion for current session.
autoload -Uz compinit && compinit

# Current VCS branch (for prompt).
vcs_branch() {
  # If in a jj repo, indicate that we're in a repo.
  if (( $+commands[jj] )) && jj root > /dev/null 2>&1; then
    echo -n " ◉ "
    return
  fi

  # If we're in a git repo, output the current branch name.
  local branch
  branch="$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)"
  if [[ -n $branch ]]; then
    echo -n " ($branch)"
  fi
}

# Prompt.
setopt prompt_subst
autoload -Uz colors && colors
PROMPT='%{$fg[yellow]%}%T %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%c%{$fg[yellow]%}$(vcs_branch)%{$reset_color%}%# '

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

# Load path additions.
if [ -f "$XDG_CONFIG_HOME/zsh/paths" ]; then
  . "$XDG_CONFIG_HOME/zsh/paths"
fi

# Load aliases.
if [ -f "$XDG_CONFIG_HOME/zsh/aliases" ]; then
  . "$XDG_CONFIG_HOME/zsh/aliases"
fi

# Load colour support.
if [ -f "$XDG_CONFIG_HOME/zsh/colors" ]; then
  . "$XDG_CONFIG_HOME/zsh/colors"
fi

# Load custom functions.
if [ -f "$XDG_CONFIG_HOME/zsh/functions" ]; then
  . "$XDG_CONFIG_HOME/zsh/functions"
fi

# Source any machine-local config.
if [[ -f "$HOME/.local/config/zsh/zshrc" ]]; then
  . "$HOME/.local/config/zsh/zshrc"
fi
