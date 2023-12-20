#!/bin/sh
#Install some basic utilities - the terminal emulator, shell and editor.
#Include any other utilities here that we aren't installing via go or rust.

if ! command -v nvim
then
	wget -P "$PROG" 'https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz'
	tar xzvf './nvim-linux64.tar.gz'
	export PATH="$PATH:$PROG/nvim-linux64/bin"
fi

if ! command -v kitty
then
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if ! command -v fish
then
	if ! command -v cmake
	then
		wget -P "$PROG" 'https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1.tar.gz'
		tar xzvf "$PROG/cmake-3.28.1.tar.gz"
		cd "cmake-3.28.1/" || exit
		./configure; make; sudo make install
		cd "$PROG" || exit
	fi
	wget -P "$PROG" 'https://github.com/fish-shell/fish-shell/releases/download/3.6.4/fish-3.6.4.tar.xz'
	tar xzvf "$PROG/fish-3.6.4.tar.xz"
	cd "fish-3.6.4/" || exit
	cmake .; make; sudo make install
	cd "$PROG" || exit
fi

if ! command -v unzip
then
	echo "unzip not present, exiting"
	exit 1
fi

JETBRAINS_EXISTS=$(fc-list | grep -c 'JetBrains')

if ! test "$JETBRAINS_EXISTS" = 0
then
	wget -P "$PROG" 'https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip'
	sudo mkdir -p '/usr/share/fonts/JetBrains'
	tar -C '/usr/share/fonts/JetBrains' -x -z -v -f "$PROG/JetBrainsMono-2.304.zip"
	sudo fc-cache -fv
fi

if ! command -v zoxide
then
	curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi
