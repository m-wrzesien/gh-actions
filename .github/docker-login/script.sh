#!/bin/bash

set -euo pipefail

echo "$PASSWORD" | docker login "$REGISTRY" -u "$USERNAME" --password-stdin