alias cat="batcat"
alias cd="z"
alias cdl='cd "$(fd -td . | sk)"'

alias cfn="nvim $HOME/.dotfiles/nvim/init.lua"
alias cfs="nvim $HOME/.dotfiles/starship/starship.toml"
alias cfw="nvim $HOME/.dotfiles/wezterm/wezterm.lua"

alias finit="veracrypt -t -d && sudo rmdir -v /media/* && sudo bleachbit -c --preset && windscribe disconnect && sudo shutdown now"

alias la="ls -a"
alias ll="ls -l"
alias ls="lsd"

alias lbry="$HOME/Downloads/prog/lbry.AppImage"

alias pas="$HOME/scripts/pass.fish"
alias pcsx2="$HOME/Downloads/prog/pcsx2.AppImage"
alias yt="$HOME/scripts/youtube.bash"

alias ssh="wezterm ssh"

alias ff="clear; fastfetch -c $HOME/source/fastfetch/presets/examples/6.jsonc"

alias less="$HOME/neovim/share/nvim/runtime/macros/less.sh"
