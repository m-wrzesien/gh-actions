#!/bin/bash

set -euo pipefail

docker push "$TAG"
# docker images only prints digests when images doesn't have a tag
imageWithoutTag=$(echo "$TAG" | awk -F: '{print $1}')
echo "digest=$(docker image ls "$imageWithoutTag" --format '{{.Digest}}' --digests | head -n1)" >>"$GITHUB_OUTPUT"
