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
alias cfa="nvim $DOTFILES_DIR/zsh/aliases.zsh"
alias cfn="nvim $DOTFILES_DIR/nvim/init.lua"
alias cfs="nvim $DOTFILES_DIR/starship/starship.toml"
alias cfw="nvim $DOTFILES_DIR/wezterm/wezterm.lua"

#clear fastfetch
alias ff="clear; fastfetch"

#leave computer
alias finit="veracrypt -t -d && sudo rmdir -v /media/* && sudo bleachbit -c --preset && windscribe disconnect && sudo shutdown now"

#replace less with nvim
alias less="$HOME/neovim/share/nvim/runtime/scripts/less.sh"

#use wezterm's ssh utility
alias ssh="wezterm ssh"

#replace wget with wget2
alias wget="wget2"

alias df="duf -usage-threshold '0.9,0.99' -output mountpoint,size,used,avail,usage,type /media/*"

#easy access for scripts and appimages
alias lbry="$APPIMAGE_DIR/lbry.AppImage"
alias pcsx2="$APPIMAGE_DIR/pcsx2.AppImage"
alias pas="$SCRIPTS_DIR/pass.zsh"
alias yt="$SCRIPTS_DIR/youtube.bash"

#lf into common dirs
lf1() {
    lf "$(zoxide query "${1}")"
}

refresh() {
    "$SCRIPTS_DIR/nvim-build.sh"
    "$SCRIPTS_DIR/git-annex-build.sh"
    "$SCRIPTS_DIR/gdl-ytdlp-build.sh"
}
