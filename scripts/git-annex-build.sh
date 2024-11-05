#!/bin/sh

cd "$SRC/git-annex" || exit

git pull origin

if ! command -v stack
then
    curl -sSL https://get.haskellstack.org/ | sh
else
    stack upgrade
fi

stack setup; stack build;
make install-home BUILDER=stack

cd "$SRC" || exit
