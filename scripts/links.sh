#!/bin/sh
#Here we replace all the default config files with our own.

DOTFILES="$HOME/.dotfiles"

#nvim
rm "$HOME/.config/nvim/init.vim"
ln -svt "$HOME/.config/nvim/" "$DOTFILES/nvim/init.vim"

#lf
rm -v "$HOME/.config/lf/"*
for i in "$DOTFILES/lf/"*
do
	ln -svt "$HOME/.config/lf/" "$i"
done

#starship
rm -v "$HOME/.config/starship.toml"
ln -svt "$HOME/.config/" "$DOTFILES/starship/starship.toml"

#fish
rm -v "$HOME/.config/fish/"*
for i in "$DOTFILES/fish/"*
do
	ln -svt "$HOME/.config/fish/" "$i"
done
