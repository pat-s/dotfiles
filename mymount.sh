#! /bin/bash

sudo pkill -kill -f "sshfs"
sudo umount -f /mnt/mccoy
sudo umount -l /mnt/mccoy
sudo umount -f /mnt/venus
sudo umount -l /mnt/venus
sudo umount -a -t cifs -l
sudo bash /home/pjs/mount.sh
