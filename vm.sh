#!/bin/bash
set -e
[ "$EUID" -ne 0 ] && exit 1
read -p "VM name: " VM
id "$VM" &>/dev/null && exit 1
useradd -m -s /bin/bash "$VM"
echo "$VM:$VM" | chpasswd
usermod -aG sudo "$VM"
echo "done"
