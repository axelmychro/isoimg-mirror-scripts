#!/bin/sh
. ./00-config.sh

readonly path='http://sgmirror.nyarchlinux.moe/Nyarch-Nv-KDE-26.04.iso'

readonly src="$path"
log "$src"

wget -- "$src"
