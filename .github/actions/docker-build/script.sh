#!/bin/bash

set -euo pipefail

docker build -t "$TAG" "$CONTEXT"
