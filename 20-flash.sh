#!/bin/sh
set -eu

readonly src="${1:?no src}"
readonly out="${2:?no out}"

sudo dd bs=4M if="$src" of="$out" status=progress oflag=sync
