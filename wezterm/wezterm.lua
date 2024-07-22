local wezterm = require 'wezterm'

wezterm.on('user-var-changed', function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while (number_value > 0) do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return {
	default_prog = { '/usr/local/bin/zsh', '--login' },
	default_cwd = wezterm.home_dir,
	check_for_updates = false,

	font = wezterm.font_with_fallback {
		{ family = 'JetBrains Mono', weight = 'Medium',
			harfbuzz_features = {
				'ss02=1',
				'zero=1',
				'cv03=1',
				'cv04=1',
				'cv14=1',
				'cv15=1',
				'cv16=1',
				'cv18=1',
				'cv19=1',
				'cv20=1'
			}
		},
		{ family = 'Symbols Nerd Font Mono',      weight = 'Regular' },
		{ family = 'Noto Color Emoji',            weight = 'Regular' },
		{ family = 'Unifont Upper',               weight = 'Regular' },
		{ family = 'Last Resort High-Efficiency', weight = 'Regular' }
	},
	font_size = 13.50,
	line_height = 1.00,
	cell_width = 1.00,

	window_decorations = "RESIZE",
	color_scheme = 'Tokyo Night',

	default_cursor_style = 'BlinkingUnderline',
	use_fancy_tab_bar = false,
	tab_max_width = 160,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 1.00,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	},
	keys = {
		{ key = 'F1',  mods = 'SUPER',      action = wezterm.action.SpawnCommandInNewTab { cwd = wezterm.home_dir } },
		{ key = 'F2',  mods = 'SUPER',      action = wezterm.action.SplitHorizontal { cwd = wezterm.home_dir } },
		{ key = 'q',   mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = false } },
		{ key = 'F11', mods = 'CTRL|SHIFT', action = wezterm.action.ToggleFullScreen },
		{ key = 'U',   mods = 'CTRL|SHIFT', action = wezterm.action.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } }
	}
}
