#!/usr/bin/env bash
set -e
set -o pipefail
set -x

if [ -z "$CS2_HOME" ]; then
    echo "Error: env var CS2_HOME is not set."
    exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null || {
    echo "Error: failed to change directory."
    exit 1
}
cp -f ./*.cfg "$CS2_HOME/cfg/" || {
    echo "Error: failed to copy cfg files."
    exit 1
}
cp -f ./custom/*.cfg "$CS2_HOME/cfg/" || {
    echo "Error: failed to copy custom cfg files."
    exit 1
}
