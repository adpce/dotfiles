#replace ls with lsd
alias ls="eza --icons"
alias la="eza --all --icons"
alias ll="eza --long --icons"

#replace cat with batcat
alias cat="bat"

#replace cd with zoxide
alias cd="z"

#cd into the selected option from a list of dirs below this one
alias cdl='cd "$(fd -td . | sk)"'

#make it easier to access config files
alias cfa="nvim $HOME/.dotfiles/zsh/aliases.zsh"
alias cfn="nvim $HOME/.dotfiles/nvim/init.lua"
alias cfs="nvim $HOME/.dotfiles/starship/starship.toml"
alias cfw="nvim $HOME/.dotfiles/wezterm/wezterm.lua"

#clear fastfetch
alias ff="clear; fastfetch -c $HOME/source/fastfetch/presets/examples/6.jsonc"

#leave computer
alias finit="veracrypt -t -d && sudo rmdir -v /media/* && sudo bleachbit -c --preset && windscribe disconnect && sudo shutdown now"

#replace less with nvim
alias less="$HOME/neovim/share/nvim/runtime/scripts/less.sh"

#use wezterm's ssh utility
alias ssh="wezterm ssh"

#replace wget with wget2
alias wget="wget2"

#easy access for scripts and appimages
alias lbry="$HOME/Downloads/prog/appimage/lbry.AppImage"
alias pcsx2="$HOME/Downloads/prog/appimage/pcsx2.AppImage"
alias pas="$HOME/scripts/pass.zsh"
alias yt="$HOME/scripts/youtube.bash"

#lf into common dirs
lf1() {
    lf $(zoxide query "${1}")
}
