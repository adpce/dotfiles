#!/usr/bin/env zsh

cd "$SOURCECODE_DIR/gallery-dl" || exit

git restore .; git pull origin
sudo make clean; make; sudo make install

cd "$SOURCECODE_DIR/yt-dlp" || exit

git restore .; git pull origin
make clean; make; sudo make install

cd "$SOURCECODE_DIR" || exit
