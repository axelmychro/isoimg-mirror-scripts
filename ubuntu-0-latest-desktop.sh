#!/bin/sh
. ./00-config.sh

readonly path="rsync://mirror.freedif.org/ubuntu-releases"

latest_version="$(list "$path" |
	awk -- '{print $NF}' |
	grep -- '^[0-9]' |
	sort -V -- |
	tail -n1 --)"
readonly latest_version
log "Latest $latest_version"

iso_file="$(list "$path/$latest_version/" | awk '/\.iso$/ && /desktop/ {print $NF}')"
log "Found $iso_file"

src="$path/$latest_version/$iso_file"
download "$src"
