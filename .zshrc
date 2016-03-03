# .zshrc

# environment vars
export EDITOR=/usr/bin/vim
export GNUPGHOME="$HOME/.gnupg"
export TERMINAL=urxvt

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# write history command-by-command, don't overwrite
setopt INC_APPEND_HISTORY

# extended glob
setopt EXTENDED_GLOB

# vi-mode
bindkey -v
bindkey -M vicmd 'q' push-line
bindkey -M viins 'jj' vi-cmd-mode

# completion
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# current git branch (for prompt)
git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $branch ]]; then
    echo " ($branch)"
  fi
}

# prompt
setopt prompt_subst
autoload -Uz colors && colors

# uncomment for a colored prompt, if the terminal has the capability
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PROMPT='%{$fg[yellow]%}%T %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%c%{$fg[yellow]%}$(git_branch)%{$reset_color%}%# '
else
  PROMPT="%T %n@%m:%c$(git_branch)%# "
fi
unset color_prompt force_color_prompt

# If procfs is available, get the terminal executable
term_bin=""
if [[ -e /proc/$PPID/cmdline ]]; then
  term_bin="${$(</proc/$PPID/cmdline):t}"
fi

if [[ "$COLORTERM" = "gnome-terminal" ]] || \
   [[ "$TERM_PROGRAM" = "iTerm.app" ]] || \
   [[ "$term_bin" == gnome-terminal* ]] || \
   [[ "$term_bin" == urxvt* ]]; then
  export TERM=xterm-256color
fi

# path additions
if [ -f ~/.paths ]; then
  . ~/.paths
fi

# aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# color
if [ -f ~/.colors ]; then
  . ~/.colors
fi

# functions
if [ -f ~/.sh_functions ]; then
  . ~/.sh_functions
fi

# tools
if [ -f ~/.tools ]; then
  . ~/.tools
fi

# login message
if [ -x "/usr/games/fortune" ]; then
  /usr/games/fortune
elif [ -x "/opt/local/bin/fortune" ]; then
  /opt/local/bin/fortune
fi
echo
