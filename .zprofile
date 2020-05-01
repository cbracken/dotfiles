# .zprofile

# Set the terminal size if we're on a serial line.
if [[ -x /usr/bin/resizewin ]]; then /usr/bin/resizewin -z; fi

# Add temporary environment.
DAEMON_RUNTIME_HOME="$HOME/.local/tmp"

# Start ssh-agent daemon.
export SSH_AUTH_SOCK="$DAEMON_RUNTIME_HOME/ssh-agent.sock"
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  mkdir -p "$DAEMON_RUNTIME_HOME"
  eval $(ssh-agent -s -a "$SSH_AUTH_SOCK") > /dev/null
  trap 'ssh-agent -k > /dev/null' EXIT
fi

# Clean up temporary environment.
unset DAEMON_RUNTIME_HOME
