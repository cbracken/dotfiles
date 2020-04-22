# .zprofile

# Set the terminal size if we're on a serial line.
if [[ -x /usr/bin/resizewin ]]; then /usr/bin/resizewin -z; fi

# Start ssh-agent daemon.
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOST.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi
