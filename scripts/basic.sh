#!/bin/sh
#Install some basic utilities - the terminal emulator, shell and editor.
#Include any other utilities here that we aren't installing via go or rust.

if ! command -v cmake
then
    git clone 'https://gitlab.kitware.com/cmake/cmake.git'
    cd "cmake/" || exit
    ./bootstrap && make && sudo make install
    cd "$SRC" || exit
fi

if ! command -v nvim
then
    git clone 'https://github.com/neovim/neovim'
    cd "neovim/" || exit
    . nvim-build.sh
    cd "$SRC" || exit
fi

if ! command -v unzip
then
    echo "unzip not present, exiting"
    exit 1
fi

JETBRAINS_EXISTS=$(fc-list | grep -c 'JetBrains')

if test "$JETBRAINS_EXISTS" = 0
then
    wget -P "$SRC" 'https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip'
    mkdir -p "$HOME/.local/share/fonts/JetBrains"
    unzip -d "$HOME/.local/share/fonts/JetBrains" "$SRC/JetBrainsMono-2.304.zip"
fi

MAPLE_EXISTS=$(fc-list | grep -c 'Maple Mono')

if test "$MAPLE_EXISTS" = 0
then
    wget -P "$SRC" 'https://github.com/subframe7536/maple-font/releases/download/v6.4/MapleMono-ttf.zip'
    mkdir -p "$HOME/.local/share/fonts/MapleMono"
    unzip -d "$HOME/.local/share/fonts/MapleMono" "$SRC/MapleMono-ttf.zip"
fi

fc-cache -fv

if ! command -v zoxide
then
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

if ! command -v git-annex
then
    git clone 'git://git-annex.branchable.com/' git-annex
    cd "git-annex" || exit
    . git-annex-build.sh
    cd "$SRC" || exit
fi
