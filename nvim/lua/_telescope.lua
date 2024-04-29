require('telescope').setup {
	defaults = {
		layout_config = {
			width = 0.9
		},
	},
	pickers = {
		git_branch = {
			theme = "ivy"
		},
		git_commit = {
			theme = "ivy"
		},
		keymaps = {
			theme = "cursor"
		},
		registers = {
			theme = "cursor"
		},
		buffers = {
			mappings = {
				i = {
					["<C-d>"] = require('telescope.actions').delete_buffer
				}
			}
		},
		extensions = {}
	}
}
