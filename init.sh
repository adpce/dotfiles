#!/bin/sh
#This is where it all happens.

SRC="$HOME/source"

mkdir -p "$SRC"

cd "$SRC" || exit

. scripts/check.sh
. scripts/basic.sh
. scripts/rust.sh
. scripts/go.sh
. scripts/links.sh

cd || exit
