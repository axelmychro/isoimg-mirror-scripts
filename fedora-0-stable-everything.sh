#!/bin/sh
. ./00-config.sh

readonly path='rsync://gsl-syd.mm.fcix.net/fedora-enchilada/linux/releases'
latest_rel="$(list "$path/" |
	awk -- '{print $NF}' |
	grep -v -- 'test' |
	sort -V -- |
	tail -n1 --)"
log "Latest $latest_rel"
readonly latest_rel="$path/$latest_rel"

edition="$(list "$latest_rel/" |
	awk -- '{print $NF}' |
	grep -i -- 'Everything' |
	tail -n1 --)"
log "Choose $edition"
readonly edition="$latest_rel/$edition"

arch="$(list "$edition/" |
	awk -- '/x86_64/ {print $NF}' |
	tail -n1 --)"
log "Choose $arch"
readonly arch="$edition/$arch/iso"

iso_file="$(list "$arch/" |
	awk -- '/\.iso$/ {print $NF}' |
	sort -V -- |
	tail -n10 --)"
log "Found $iso_file"
readonly iso_file="$arch/$iso_file"

readonly src="$iso_file"
log "$src"

download "$src"
