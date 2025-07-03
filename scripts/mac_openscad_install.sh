#!/bin/bash
set -euo pipefail

BIN=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
BIN_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/openscad"

# If BIN exists and is a binary and NOT a symlink to a script, fail / ask user to rename the app.
if [[ -x "$BIN" && ! -L "$BIN" ]]; then
    echo "OpenSCAD binary found at $BIN. Please rename the app to OpenSCAD_Real.app to avoid conflicts with the script."
    exit 1
fi

mkdir -p "$(dirname "$BIN")"
ln -sf "$BIN_SCRIPT" "$BIN"