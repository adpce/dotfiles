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
