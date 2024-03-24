require('zen-mode').setup({
	window = {
		backdrop = 1,
		width = 0.60, -- width of the Zen window
		height = 1, -- height of the Zen window
		options = {
			signcolumn = "no", -- disable signcolumn
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
			cursorline = false, -- disable cursorline
			cursorcolumn = false, -- disable cursor column
			foldcolumn = "0", -- disable fold column
			list = false, -- disable whitespace characters
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
			-- statusline will be shown only if 'laststatus' == 3
			laststatus = 0, -- turn off the statusline in zen mode
		},
		twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = false }, -- disables git signs
		tmux = { enabled = false }, -- disables the tmux statusline
		-- this will change the font size on wezterm when in zen mode
		-- See alse also the Plugins/Wezterm section in this projects README
		wezterm = {
			enabled = true,
			-- can be either an absolute font size or the number of incremental steps
			font = "+0", -- (10% increase per step)
		},
	},
	-- callback where you can add custom code when the Zen window opens
	on_open = function(win)
	end,
	-- callback where you can add custom code when the Zen window closes
	on_close = function()
	end,
})
