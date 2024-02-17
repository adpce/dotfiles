local deus = require('_deus')

require('lualine').setup {
	options = {
		icons_enabled = true,
		--theme = deus,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'diff', 'branch', 'filename'},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {'encoding', { 'fileformat', symbols = { unix = '󰻀 (unix)' } }, 'filetype', { 'diagnostics', sources = { 'nvim_lsp' }, always_visible = true  }},
		lualine_z = {'progress', 'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

