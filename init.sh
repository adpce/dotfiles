#!/bin/sh
#This is where it all happens.

PROG="$HOME/Downloads/prog"

mkdir -p "$PROG"

cd "$PROG" || exit

. "scripts/check.sh"
. "scripts/basic.sh"
. "scripts/rust.sh"
. "scripts/go.sh"
. "scripts/links.sh"

cd || exit
