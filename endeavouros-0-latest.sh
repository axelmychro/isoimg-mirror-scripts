#!/bin/sh
. ./00-config.sh

readonly path="$MIRROR/EndeavourOS/iso"
iso_file="$(list "$path/" |
	awk -- '/\.iso$/ {print $NF}' |
	sort -n -- |
	tail -n8 -- |
	sort -V -- |
	tail -n1 --)"
log "Found $iso_file"

readonly src="$path/$iso_file"
log "$src"

download "$src"
