# .zprofile

# Set the terminal size if we're on a serial line.
if [[ -x /usr/bin/resizewin ]]; then /usr/bin/resizewin -z; fi

if [[ "$(uname)" == "Linux" || "$(uname)" == "FreeBSD" ]]; then
  # ssh-agent is started by systemd; add the socket path to the environment.
  export "$(systemctl --user show-environment | grep '^SSH_AUTH_SOCK=')"
elif [[ "$(uname)" == "FreeBSD" ]]; then
  # Start ssh-agent daemon.
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  ssh-add -l 2>/dev/null >/dev/null
  if [ $? -ge 2 ]; then
    # If not already running, start ssh-agent. Stop on shell exit.
    eval $(ssh-agent -s -a "$SSH_AUTH_SOCK") > /dev/null
    trap 'ssh-agent -k > /dev/null' EXIT
  fi
fi
