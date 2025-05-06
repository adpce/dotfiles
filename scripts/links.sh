#!/bin/sh

#Here we make symlinks to all the relevant executables in /usr/local/bin.

#Here we replace all the default config files with our own.
for DIR in nvim lf zsh wezterm
do
    rm -rv "${XDG_CONFIG_HOME:?}/${DIR}"
    mkdir -p "$XDG_CONFIG_HOME/$DIR"
done

#nvim
ln -svt "$XDG_CONFIG_HOME/nvim/" "$DOTFILE_DIR/nvim/init.lua"
mkdir -p "$XDG_CONFIG_HOME/nvim/lua"
for file in "$DOTFILE_DIR/nvim/"*.lua
do
    ln -svt "$XDG_CONFIG_HOME/nvim/lua" "$file"
done

#lf
for file in "$DOTFILE_DIR/lf/"*
do
    ln -svt "$XDG_CONFIG_HOME/lf/" "$file"
done

#starship
rm -v "$XDG_CONFIG_HOME/starship.toml"
ln -svt "$XDG_CONFIG_HOME/" "$DOTFILE_DIR/starship/starship.toml"

#zsh
rm "$HOME/.zprofile"
ln -sv "$DOTFILE_DIR/zsh/zprofile" "$HOME/.zprofile"
ln -sv "$DOTFILE_DIR/zsh/zshrc" "$XDG_CONFIG_HOME/zsh/.zshrc"
ln -sv "$DOTFILE_DIR/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" "$XDG_CONFIG_HOME/zsh/zsh-syntax-highlighting.zsh"
ln -sv "$DOTFILE_DIR/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" "$XDG_CONFIG_HOME/zsh/zsh-autosuggestions.zsh"
ln -sv "$DOTFILE_DIR/zsh/zsh-you-should-use/you-should-use.plugin.zsh" "$XDG_CONFIG_HOME/zsh/zsh-you-should-use.plugin.zsh"

#wezterm
ln -svt "$XDG_CONFIG_HOME/wezterm" "$DOTFILE_DIR/wezterm/wezterm.lua"

