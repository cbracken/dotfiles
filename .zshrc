# .zshrc

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# extended glob
setopt extendedglob

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
  echo $(git rev-parse --abbrev-ref HEAD 2> /dev/null)
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
  PROMPT="%{$fg[yellow]%}%T %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%c%{$reset_color%}%# "
  RPROMPT=$'%{$fg[yellow]%}$(git_branch)%{$reset_color%}'
else
  PROMPT="%T %n@%m:%c%# "
  RPROMPT=$'$(git_branch)'
fi
unset color_prompt force_color_prompt

if [ "$COLORTERM" = "gnome-terminal" -o "$TERM_PROGRAM" = "iTerm.app" ]; then
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
