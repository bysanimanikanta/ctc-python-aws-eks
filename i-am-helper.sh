#!/usr/bin/bash
set -e

echo "Please enter your LanID to create K8s objects in your namespace:"
read LAN_ID

if [ -z "$LAN_ID" ]; then
	echo "Do not try to break me!!! Please enter your LAN ID"
	exit 1
fi

LAN_ID_LOWER=$(echo $LAN_ID | tr "[:upper:]" "[:lower:]")
echo "Replacing all the k8s object files with $LAN_ID_LOWER as namespaces"
sed -i "s/REPLACEME/$LAN_ID_LOWER/g" k8s/*.yaml
echo "Done"