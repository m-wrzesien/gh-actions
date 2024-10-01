#!/bin/bash

set -euo pipefail

docker push "$TAG"
echo "digest='$(docker image ls "$TAG" --format '{{.Digest}}' --digests | head -n1)'" >> "$GITHUB_OUTPUT"