#!/bin/sh
#All the rust stuff happens here.
#Also install cargo, if not already installed.

cd "$SOURCECODE_DIR" || exit

if ! command -v cargo
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup update
cargo install ripgrep skim fd-find du-dust procs git-delta hexyl tealdeer grex shellharden choose gitui eza pastel
cargo install --locked broot hyperfine starship bat
cargo install --locked --all-features --git https://github.com/ms-jpq/sad --branch senpai

for BINARY in "${CARGO_HOME}/bin/"*
do
    sudo ln -svt "/usr/local/bin" "$(realpath "$BINARY")"
done

#wezterm
if ! command -v wezterm
then
    git clone --depth=1 --branch=main --recursive 'https://github.com/wez/wezterm.git'
fi

cd "wezterm/" || exit
git clean -fd
git pull origin
git submodule update --init --recursive
./get-deps
cargo build --release
sudo ln -svt "/usr/local/bin" "${SOURCECODE_DIR}/wezterm/target/release/wezterm"

cd || exit
