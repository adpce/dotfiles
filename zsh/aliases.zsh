alias cd="z"

alias cfn="nvim $HOME/.dotfiles/nvim/init.vim"
alias cfs="nvim $HOME/.dotfiles/starship/starship.toml"
alias cfw="nvim $HOME/.dotfiles/wezterm/wezterm.lua"

alias finit="veracrypt -t -d && sudo rmdir -v /media/* && sudo bleachbit -c --preset && windscribe disconnect && sudo shutdown now"

alias ll="ls -l"
alias ls="lsd"

alias yt="~/scripts/youtube.bash"
alias ytu="for YT in \"$(choose -f '\t' -i ~/list 1)\"; do yt \"$YT\"; done"
