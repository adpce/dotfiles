local wezterm = require 'wezterm'
local config = {
	default_prog = { '/bin/fish' },
	font = wezterm.font('JetBrains Mono', { weight = 'Medium' }),
	font_size = 12.00,

	color_scheme = 'Catppuccin Mocha',

	default_cursor_style = 'BlinkingUnderline',
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.9,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	},
	keys = {
		{
			key = 'F1',
			mods = 'SUPER',
			action = wezterm.action.SpawnTab 'DefaultDomain'
		},
		{
			key = 'F2',
			mods = 'SUPER',
			action = wezterm.action.SplitHorizontal { domain = 'DefaultDomain' }
		}
	}
}

return config
