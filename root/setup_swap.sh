#!/bin/sh

dd if=/dev/zero of=/swap bs=1M count=1024
chmod 600 /swap
mkswap /swap
swapon /swap
echo "/swap  swap  swap  nosuid noatime discard  0 0" >> /etc/fstab
