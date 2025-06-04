#!/bin/bash
# Jalankan tmate secara otomatis saat container start

# Generate SSH key jika belum ada
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
fi

# Jalankan tmate dan cetak SSH connection string
tmate -F &
sleep 3
tmate display -p '#{tmate_ssh}' > /tmp/tmate-ssh.txt
echo "Connect via SSH:"
cat /tmp/tmate-ssh.txt

# Supaya container tetap jalan
tail -f /dev/null
