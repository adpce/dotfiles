#!/bin/sh
#All the rust stuff happens here.
#Also install cargo, if not already installed.

cd "$SOURCECODE_DIR" || exit

if ! command -v cargo
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup update
cargo install ripgrep skim fd-find du-dust procs git-delta hexyl tealdeer grex shellharden choose gitui eza
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
git pull origin
git submodule update --init --recursive
./get-deps
cargo build --release
sudo ln -svt "/usr/local/bin" "${SOURCECODE_DIR}/wezterm/target/release/wezterm"

cd ..

#alacritty
if ! command -v alacritty
then
    git clone https://github.com/alacritty/alacritty.git
fi

cd "alacritty/" || exit
git pull origin
if uname -r | grep "Ubuntu"
then
    sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 scdoc
fi
cargo build --release

#desktop files
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

#documentation
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

sudo ln -svt "/usr/local/bin" "${SOURCECODE_DIR}/alacritty/target/release/alacritty"

cd || exit
