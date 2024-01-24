local wezterm = require 'wezterm'
local config = {
	default_prog = { '/bin/fish' },
	default_cwd = wezterm.home_dir,
	check_for_updates = false,

	font = wezterm.font_with_fallback {
	--	{
	--		family = 'Maple Mono',
	--		weight = 'Regular',
	--		harfbuzz_features = { 'ss01', 'ss02', 'ss04', 'ss05', 'cv03' }
	--	},
		{
			family = 'JetBrains Mono',
			weight = 'Bold'
		},
		{
			family = 'Symbols Nerd Font Mono',
			weight = 'Regular'
		}
	},
	font_size = 12.50,
	line_height = 1.00,
	cell_width = 1.05,

	color_scheme = 'tokyonight_night',
	background = {
		{
			source = { File = wezterm.home_dir .. '/Pictures/stormyday.jpg' },
			repeat_x = 'Mirror',
			width = '100%',
			attachment = "Fixed",
			hsb = { brightness = 0.1 }
		}
	},

	default_cursor_style = 'BlinkingUnderline',
	use_fancy_tab_bar = false,
	tab_max_width = 160,
	tab_bar_at_bottom = true,
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
			action = wezterm.action.SpawnCommandInNewTab { cwd = wezterm.home_dir }
		},
		{
			key = 'F2',
			mods = 'SUPER',
			action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
		},
		{
			key = 'q',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.CloseCurrentTab { confirm = false }
		},
		{
			key = 'F11',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.ToggleFullScreen
		},
		{
			key = 'U',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.CharSelect {
				copy_on_select = true,
				copy_to = 'ClipboardAndPrimarySelection'
			}
		}
	}
}
return config
