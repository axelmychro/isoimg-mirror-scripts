#!/bin/sh
. ./00-config.sh

readonly path='rsync://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/releases/x86_64'

iso_file="$(list "$path/" | awk '/virt/ && /\.iso$/ {print $NF}' | sort -V | tail -n1)"
log "Found $iso_file"

src="$path/$iso_file"
log "$src"

download "$src"
