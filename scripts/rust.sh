#!/bin/sh
#All the rust stuff happens here.
#Also install cargo, if not already installed.

if ! command -v cargo
then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup update
cargo install ripgrep skim fd-find du-dust procs git-delta hexyl tealdeer ytop grex eza shellharden choose
cargo install --locked broot hyperfine
cargo install --locked --all-features --git https://github.com/ms-jpq/sad --branch senpai
