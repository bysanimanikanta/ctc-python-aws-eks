#!/usr/bin/bash
set -e

echo "Please enter your LanID to export in bash profile:"
read LAN_ID

if [ -z "$LAN_ID" ]; then
        echo "Do not try to break me!!! Please enter your LAN ID"
        exit 1
fi

LAN_ID_LOWER=$(echo $LAN_ID | tr "[:upper:]" "[:lower:]")
echo "export LAN_ID=$LAN_ID_LOWER" | tee -a ~/.bash_profile
echo "Do not forget to source ~/.bash_profile"