#!/bin/bash

set -euo pipefail

if [ "$DEBUG" = true ]; then
    echo "Enabling debug mode"
    set -x
fi

echo "$PASSWORD" | docker login "$REGISTRY" -u "$USERNAME" --password-stdin