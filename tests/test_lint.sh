#!/bin/bash

# ShellCheck integration for the project
echo "Running ShellCheck on all shell scripts..."

if ! command -v shellcheck &> /dev/null; then
    echo "[SKIP] shellcheck is not installed."
    exit 0
fi

find . -name "*.sh" -not -path "*/.git/*" -print0 | while IFS= read -r -d '' file; do
    echo "Checking $file..."
    if shellcheck -e SC2034,SC1091 "$file"; then
        echo "[OK] $file"
    else
        echo "[FAIL] $file"
        exit 1
    fi
done

echo "All scripts passed ShellCheck."
