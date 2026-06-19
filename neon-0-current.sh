#!/bin/sh
. ./00-config.sh

readonly path='rsync://mirror.freedif.org/KDE/files/neon/images/desktop/user/current/'
iso_file="$(list "$path/" |
	awk -- '/\.iso$/ {print $NF}' |
	sort -V -- |
	tail -n1 --)"
readonly iso_file
log "Found $iso_file"

readonly src="$path/$iso_file"
log "$src"

download "$src"
