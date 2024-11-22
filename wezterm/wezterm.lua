local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('user-var-changed', function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while (number_value > 0) do
				window:perform_action(act.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(act.ResetFontSize, pane)
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
				'ss01=1', --make everything straight
				'ss02=0', --make everything curly
				'zero=0', --zero with slash instead of dot
				'cv03=0', --curly g
				'cv04=0', --curly j
				'cv14=1', --$ symbol with broken bar
				'cv15=0', --alternate &
				'cv16=0', --curly Q
				'cv18=0', --2,6,9
				'cv19=0', --8
				'cv20=0' --5
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
	tab_and_split_indices_are_zero_based = true,
	show_tab_index_in_tab_bar = true,
	tab_max_width = 160,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.75,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	},
	keys = {
		{ key = 'F1',  mods = 'SUPER',      action = act.SpawnCommandInNewTab { cwd = wezterm.home_dir } },
		{ key = 'F2',  mods = 'SUPER',      action = act.SplitHorizontal { cwd = wezterm.home_dir } },
		{ key = 'q',   mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = false } },
		{ key = 'F11', mods = 'CTRL|SHIFT', action = act.ToggleFullScreen },
		{ key = 'U',   mods = 'CTRL|SHIFT', action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } }
	}
}
