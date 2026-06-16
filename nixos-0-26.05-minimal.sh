#!/bin/sh
. ./00-config.sh

readonly path='https://channels.nixos.org/nixos-26.05/latest-nixos-minimal-x86_64-linux.iso'

readonly src="$path"
log "$src"

readonly out='nixos-26.05-minimal.iso'

wget -- "$src" -o "$out"
