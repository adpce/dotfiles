#!/bin/sh
#Check for some basic utilities. If they aren't here, quit and let the user deal with it.

if ! command -v git
then
    echo "git not installed, exiting"
    exit 1
fi

if ! command -v zsh
then
    git clone 'git://git.code.sf.net/p/zsh/code' zsh
    cd "zsh/" || exit
    ./configure && make && sudo make install
    cd "$SOURCECODE_DIR" || exit
fi

if ! command -v curl
then
    echo "curl not installed, exiting"
    exit 1
fi

if ! command -v tar
then
    echo "tar not installed, exiting"
    exit 1
fi

if ! command -v wget
then
    echo "wget not installed, exiting"
    exit 1
fi
