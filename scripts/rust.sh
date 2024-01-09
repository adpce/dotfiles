#!/bin/sh
#All the rust stuff happens here.
#Also install cargo, if not already installed.

if ! command -v cargo
then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup update
cargo install ripgrep skim fd-find du-dust procs git-delta hexyl tealdeer ytop grex lsd shellharden choose
cargo install --locked broot hyperfine
cargo install --locked --all-features --git https://github.com/ms-jpq/sad --branch senpai

#wezterm
wget -P "$PROG" 'https://github.com/wez/wezterm/releases/download/20230712-072601-f4abf8fd/wezterm-20230712-072601-f4abf8fd-src.tar.gz'
tar -xzf 'wezterm-20230712-072601-f4abf8fd-src.tar.gz'
cd 'wezterm-20230712-072601-f4abf8fd' || exit
./get-deps
cargo build --release
ln -svt "$HOME/.local/bin" './wezterm'

cd "$PROG" || exit
