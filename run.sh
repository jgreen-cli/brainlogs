#!/bin/bash

# Wrapper script for brainlogs linux
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
python3 "$SCRIPT_DIR/main.py" "$@"
