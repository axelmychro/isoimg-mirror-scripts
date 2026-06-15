#!/bin/sh
. ./00-config.sh

readonly path="rsync://mirror.freedif.org/gentoo/releases/amd64/autobuilds/current-install-amd64-minimal"
iso_file="$(list "$path/" |
	awk -- '/\.iso$/ {print $NF}' |
	sort -V -- |
	tail -n1 --)"
readonly iso_file
log "Found $iso_file"

readonly src="$path/$iso_file"
log "$src"

readonly out="gentoo-$iso_file"
download "$src" "$out"
