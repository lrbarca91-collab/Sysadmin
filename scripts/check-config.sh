#!/usr/bin/env bash
#
# check-config.sh
#
# Verifies that config/webserver.conf exists, is non-empty, and contains
# at least one meaningful keyword expected in a webserver configuration.
#
# Exit status:
#   0 -> verification successful
#   1 -> verification failed (with an error message explaining why)

set -euo pipefail

# ─── THE FIX ──────────────────────────────────────────────────────────
# 1. Get the absolute path of the directory where this script lives
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# 2. Derive the repo root (one level up from the 'scripts' folder)
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# 3. Build the default path relative to the repo root, keeping the override option
CONFIG_FILE="${1:-$REPO_ROOT/config/webserver.conf}"
# ──────────────────────────────────────────────────────────────────────

# Keywords that indicate the file looks like a real webserver config.
# At least one of these must be present.
KEYWORDS=("server" "listen" "port")

fail() {
    echo "ERROR: $1" >&2
    exit 1
}

# 1. Check that the file exists.
if [[ ! -f "$CONFIG_FILE" ]]; then
    fail "Configuration file '$CONFIG_FILE' does not exist."
fi

# 2. Check that the file is not empty.
if [[ ! -s "$CONFIG_FILE" ]]; then
    fail "Configuration file '$CONFIG_FILE' is empty."
fi

# 3. Check that the file contains at least one meaningful keyword.
found_keyword=""
for keyword in "${KEYWORDS[@]}"; do
    if grep -qiw "$keyword" "$CONFIG_FILE"; then
        found_keyword="$keyword"
        break
    fi
done

if [[ -z "$found_keyword" ]]; then
    fail "Configuration file '$CONFIG_FILE' does not contain any expected keyword (${KEYWORDS[*]})."
fi

echo "OK: '$CONFIG_FILE' exists, is not empty, and contains keyword '$found_keyword'."
exit 0
