#!/bin/sh
#This is where it all happens.

SOURCECODE_DIR="$HOME/.source"
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"

mkdir -p "$SOURCECODE_DIR"
mkdir -p "$XDG_CONFIG_HOME"

cd "$SOURCECODE_DIR" || exit

. scripts/check.sh
. scripts/basic.sh
. scripts/rust.sh
. scripts/go.sh
. scripts/links.sh

cd || exit
