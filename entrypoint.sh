#!/bin/bash

set -e

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add the SSH private key if available
if [[ -n "$SSH_PRIVATE_KEY" ]]; then
  echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
else
  echo "WARNING: SSH_PRIVATE_KEY is not set"
fi

# Set up SSH config to disable strict host key checking
mkdir -p ~/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

# Execute the passed command
exec "$@"
