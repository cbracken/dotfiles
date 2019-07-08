# .zprofile

# Start ssh-agent.
eval $(ssh-agent -s) > /dev/null

# Set the terminal size if we're on a serial line.
if [[ -x /usr/bin/resizewin ]]; then /usr/bin/resizewin -z; fi
