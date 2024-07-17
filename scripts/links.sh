#!/bin/sh

#Here we make symlinks to all the relevant executables in /usr/local/bin.

#Here we replace all the default config files with our own.
DOTFILES="$HOME/.dotfiles"

for DIR in nvim lf zsh wezterm
do
    rm -rv "$HOME/.config/$DIR"
    mkdir -p "$HOME/.config/$DIR"
done

#nvim
ln -svt "$HOME/.config/nvim/" "$DOTFILES/nvim/init.vim"
mkdir -p "$HOME/.config/nvim/lua"
for file in "$DOTFILES/nvim/"*.lua
do
    NEWNAME="_$(basename "$file")"
    DIRNAME="$(dirname "$file")"
    MOVENAME="$HOME/.config/nvim/lua/$NEWNAME"
    ln -sv "$DIRNAME/$file" "$MOVENAME"
done

#lf
for i in "$DOTFILES/lf/"*
do
    ln -svt "$HOME/.config/lf/" "$i"
done

#starship
rm -v "$HOME/.config/starship.toml"
ln -svt "$HOME/.config/" "$DOTFILES/starship/starship.toml"

#zsh
rm "$HOME/.zprofile"
ln -sv "$DOTFILES/zsh/zprofile" "$HOME/.zprofile"
ln -sv "$DOTFILES/zsh/zshrc" "$HOME/.config/zsh/.zshrc"
ln -sv "$DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" "$HOME/.config/zsh/zsh-syntax-highlighting.zsh"
ln -sv "$DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" "$HOME/.config/zsh/zsh-autosuggestions.zsh"
ln -sv "$DOTFILES/zsh/zsh-you-should-use/you-should-use.plugin.zsh" "$HOME/config/zsh/zsh-you-should-use.plugin.zsh"

#wezterm
ln -svt "$HOME/.config/wezterm" "$DOTFILES/wezterm/wezterm.lua"

