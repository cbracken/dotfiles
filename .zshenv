# .zshenv

# Default read-only permissions for group/other.
umask 022

# Set language to Australian English, currency to Japanese Yen.
export LANG=en_AU.UTF-8
export LC_MONETARY=ja_JP.UTF-8

# If a local perl5 directory exists, add PERL5LIB.
if [[ -d "$HOME/.perl5/lib/perl5" ]]; then
  export PERL5LIB="$HOME/.perl5/lib/perl5:$PERL5LIB"
fi
