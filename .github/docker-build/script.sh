#!/bin/bash

set -euo pipefail

if [ "$DEBUG" = true ]; then
    echo "Enabling debug mode"
    set -x
fi

docker build -t "$TAG" "$CONTEXT"