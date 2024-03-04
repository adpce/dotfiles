#!/bin/sh

cd "$SRC/git-annex" || exit

if ! command -v stack
then
	curl -sSL https://get.haskellstack.org/ | sh
else
	stack upgrade
fi

stack setup; stack build;
sudo make install BUILDER=stack PREFIX=/usr/local

cd "$SRC" || exit
