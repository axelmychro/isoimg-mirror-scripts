#!/bin/sh
set -eux

readonly path='rsync://freedif.org/EndeavourOS/iso'
iso_file="$(rsync --list-only "$path/" |
	awk '/\.iso$/ {print $NF}' |
	sort -n |
	tail -n8 |
	sort -V |
	tail -n1)"
readonly src="$path/$iso_file"
rsync -LP "$src" -o .
