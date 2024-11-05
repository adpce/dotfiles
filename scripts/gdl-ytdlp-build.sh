#!/usr/bin/env bash

cd "$SRC/gallery-dl" || exit

git restore .; git pull origin
sudo make clean; make; sudo make install

cd "$SRC/yt-dlp" || exit

git restore .; git pull origin
make clean; make; sudo make install

cd "$SRC" || exit
