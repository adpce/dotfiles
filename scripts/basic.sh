#!/bin/sh

#Install some basic utilities - the terminal emulator, shell and editor.
#Include any other utilities here that we aren't installing via go or rust.

if ! command -v cmake
then
    git clone 'https://gitlab.kitware.com/cmake/cmake.git'
    cd "cmake/" || exit
    ./bootstrap && make && sudo make install
    cd "$SOURCECODE_DIR" || exit
fi

if ! command -v nvim
then
    git clone 'https://github.com/neovim/neovim'
    cd "neovim/" || exit
    . nvim-build.sh
    cd "$SOURCECODE_DIR" || exit
fi

if ! command -v unzip
then
    echo "unzip not present, exiting"
    exit 1
fi

JETBRAINS_EXISTS=$(fc-list | grep -c 'JetBrains')

if test "$JETBRAINS_EXISTS" = 0
then
    wget -P "$SOURCECODE_DIR" 'https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip'
    mkdir -p "$XDG_DATA_HOME/fonts/JetBrains"
    unzip -d "$XDG_DATA_HOME/fonts/JetBrains" "$SOURCECODE_DIR/JetBrainsMono-2.304.zip"
fi

MAPLE_EXISTS=$(fc-list | grep -c 'Maple Mono')

if test "$MAPLE_EXISTS" = 0
then
    wget -P "$SOURCECODE_DIR" 'https://github.com/subframe7536/maple-font/releases/download/v6.4/MapleMono-ttf.zip'
    mkdir -p "$XDG_DATA_HOME/fonts/MapleMono"
    unzip -d "$XDG_DATA_HOME/fonts/MapleMono" "$SOURCECODE_DIR/MapleMono-ttf.zip"
fi

fc-cache -fv

if ! command -v zoxide
then
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | zsh
fi

if ! command -v git-annex
then
    git clone 'git://git-annex.branchable.com/' git-annex
    cd "git-annex" || exit
    . git-annex-build.sh
    cd "$SOURCECODE_DIR" || exit
fi
