#!/bin/bash -eux

/usr/local/sbin/apk-install sudo
user=armand

adduser $user wheel

echo "Defaults exempt_group=wheel" > /etc/sudoers
echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers