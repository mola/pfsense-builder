#!/bin/sh

# Allow SSH using root, if you want it.
echo PermitRootLogin yes >> /etc/ssh/sshd_config
service sshd restart

# Required for configuring the server
pkg install -y pkg vim nano emacs

# Required for installing and building ports
pkg install -y git nginx poudriere-devel rsync sudo

# Required for building kernel and iso
pkg install -y vmdktool curl qemu-user-static gtar xmlstarlet pkgconf openssl

# Required for building iso
portsnap fetch extract

# not required but advised for building/monitoring/debugging
pkg install -y htop screen wget mmv

# Only install this if your FreeBSD is a virtual machine
pkg install -y open-vm-tools

# Create an 8G swap device (Not required but can be usefull if you don't have enough memory)
# dd if=/dev/zero of=/root/swap.bin bs=1M count=8192
# chmod 0600 /root/swap.bin
# mdconfig -a -t vnode -f /root/swap.bin -u 0
# echo 'swapfile="/root/swap.bin"' >> /etc/rc.conf
# swapon /dev/md0

