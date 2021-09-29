#!/usr/bin/bash
set -e

DOCKER_IMAGE_URI=112834256162.dkr.ecr.us-east-1.amazonaws.com/$LAN_ID/aws-python-eks:0.0.1-SNAPSHOT
LAN_ID_LOWER=$(echo $LAN_ID | tr "[:upper:]" "[:lower:]")

echo "Replacing all the k8s object files with $LAN_ID_LOWER as namespaces and image as $DOCKER_IMAGE_URI"
find . -type f -name "*.yaml" -exec sed -i "s/REPLACEME/$LAN_ID_LOWER/g" {} +
find . -type f -name "*.yaml" -exec sed -i "s|REPLACEDOCKERIMAGE|$DOCKER_IMAGE_URI|g" {} +
echo "Done. Do a git diff to see all the changes"