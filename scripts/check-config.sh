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

# Path to the config file, relative to the repo root.
# Allow overriding via first argument for flexibility/testing.
CONFIG_FILE="${1:-config/webserver.conf}"

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
