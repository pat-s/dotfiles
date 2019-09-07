#! /bin/bash

sudo pkill -kill -f "sshfs"
sudo umount -f /mnt/venus
sudo umount -a -t cifs
sudo bash ~/mount.sh
