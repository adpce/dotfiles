#!/bin/sh
#All the rust stuff happens here.
#Also install cargo, if not already installed.

cd "$SRC" || exit

if ! command -v cargo
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup update
cargo install ripgrep skim fd-find du-dust procs git-delta hexyl tealdeer grex lsd shellharden choose gitui
cargo install --locked broot hyperfine starship
cargo install --locked --all-features --git https://github.com/ms-jpq/sad --branch senpai

for BINARY in "$HOME/.cargo/bin/"*
do
    sudo ln -sfvt "/usr/local/bin" "$(realpath "$BINARY")"
done

#wezterm
if ! command -v wezterm
then
    git clone --depth=1 --branch=main --recursive 'https://github.com/wez/wezterm.git'
fi

cd "wezterm/" || exit
git submodule update --init --recursive
./get-deps
cargo build --release
sudo ln -sfvt "/usr/local/bin" "$HOME/source/wezterm/wezterm"

cd || exit
