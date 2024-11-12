require("tokyonight").setup({
	style = "night",
	light_style = "day",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = true },
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	hide_inactive_statusline = true,
	dim_inactive = true,
	lualine_bold = true,
	plugins = {
		auto = true
	}
})
