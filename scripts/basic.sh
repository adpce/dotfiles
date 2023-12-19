#!/bin/sh
#Install some basic utilities - the terminal emulator, shell and editor.
#Include any other utilities here that we aren't installing via go or rust.

if ! command -v nvim
then
	wget -P "$PROG" https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	tar xzvf './nvim-linux64.tar.gz'
	export PATH="$PATH:$PROG/nvim-linux64/bin"
fi

if ! command -v kitty
then
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if ! command -v fish
then
	echo
fi

if ! command -v zoxide
then
	curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi
