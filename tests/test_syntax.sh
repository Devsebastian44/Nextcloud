#!/bin/bash

# Simple syntax check for shell scripts
echo "Running syntax check on shell scripts..."

# Ensure we are in the root directory
ROOT_DIR=$(dirname "$0")/..
cd "$ROOT_DIR" || exit 1

find . -name "*.sh" -not -path "*/.git/*" -print0 | while IFS= read -r -d '' file; do
    if bash -n "$file"; then
        echo "[OK] $file"
    else
        echo "[FAIL] $file"
        exit 1
    fi
done

echo "Syntax check passed successfully."
