#!/bin/sh
set -eux

readonly src='https://channels.nixos.org/nixos-26.05/latest-nixos-minimal-x86_64-linux.iso'
readonly out='nixos-26.05-minimal.iso'
curl -L "$src" -o "$out"
