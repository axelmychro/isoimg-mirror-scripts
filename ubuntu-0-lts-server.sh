#!/bin/sh
. ./00-config.sh

readonly path="rsync://mirror.freedif.org/ubuntu-releases"

lts_version="$(list "$path" |
	awk '{print $NF}' |
	grep -- 24 |
	sort -V |
	tail -n1)"
readonly lts_version
log "LTS $lts_version"

iso_file="$(list "$path/$lts_version/" |
	awk '/\.iso$/ && /server/ {print $NF}' |
	sort -V |
	tail -n1)"
readonly iso_file
log "Found $iso_file"

readonly src="$path/$lts_version/$iso_file"
log "$src"

download "$src"
