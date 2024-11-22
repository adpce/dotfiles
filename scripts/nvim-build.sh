#!/bin/sh

cd "$SOURCECODE_DIR/neovim" || exit

git pull origin

sudo cmake --build build/ --target uninstall
sudo make clean
sudo make CMAKE_INSTALL_PREFIX="$HOME/neovim" CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd "$SOURCECODE_DIR" || exit
