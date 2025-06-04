#!/bin/bash

# Generate SSH key jika belum ada
if [ ! -f ~/.ssh/id_rsa ]; then
    mkdir -p ~/.ssh
    ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
fi

# Start tmate in the background
tmate -F > /tmp/tmate.log 2>&1 &

# Wait for tmate to initialize and print SSH string
sleep 5
TMATE_SSH=$(tmate display -p '#{tmate_ssh}')
echo "Connect to this tmate session:"
echo "$TMATE_SSH"

# Keep container running
tail -f /dev/null
