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
zstyle :compinstall filename '/Users/cbracken/.zshrc'
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# prompt
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
else
  PROMPT="%T %n@%m:%c%# "
fi
unset color_prompt force_color_prompt

# aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# color
if [ -f ~/.colors ]; then
  . ~/.colors
fi
