if status is-interactive
	# Commands to run in interactive sessions can go here
	source ~/.config/fish/variables.fish
	source ~/.config/fish/path.fish
	source ~/.config/fish/theme.fish
	source ~/.config/fish/aliases.fish
end
# nnn
source ~/.config/fish/completions/nnn.fish
# STARSHIP PROMPT
starship init fish | source
# ZOXIDE
zoxide init fish | source
# gotta go fast
xset r rate 300 50
