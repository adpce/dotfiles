local term_red = 204
local term_green = 114
local term_yellow = 180
local term_blue = 39
local term_purple = 170
local term_black = '#0A0E14'

return {
	normal = {
		a = { fg = term_black, bg = term_green, gui = 'bold' },
		b = { fg = term_green, bg = "None" },
		c = { fg = term_green, bg = "None" },
		x = { fg = term_green, bg = "None" },
		y = { fg = term_green, bg = "None" },
		z = { fg = term_black, bg = term_green, gui = 'bold' }
	},
	insert = {
		a = { fg = term_black, bg = term_blue, gui = 'bold' },
		b = { fg = term_blue, bg = "None" },
		c = { fg = term_blue, bg = "None" },
		x = { fg = term_blue, bg = "None" },
		y = { fg = term_blue, bg = "None" },
		z = { fg = term_black, bg = term_blue, gui = 'bold' }
	},
	replace = {
		a = { fg = term_black, bg = term_red, gui = 'bold' },
		b = { fg = term_red, bg = "None" },
		c = { fg = term_red, bg = "None" },
		x = { fg = term_red, bg = "None" },
		y = { fg = term_red, bg = "None" },
		z = { fg = term_black, bg = term_red, gui = 'bold' }
	},
	visual = {
		a = { fg = term_black, bg = term_purple, gui = 'bold' },
		b = { fg = term_purple, bg = "None" },
		c = { fg = term_purple, bg = "None" },
		x = { fg = term_purple, bg = "None" },
		y = { fg = term_purple, bg = "None" },
		z = { fg = term_black, bg = term_purple, gui = 'bold' }
	},
	command = {
		a = { fg = term_black, bg = term_yellow, gui = 'bold' },
		b = { fg = term_yellow, bg = "None", gui = 'bold' },
		c = { fg = term_yellow, bg = "None", gui = 'bold' },
		x = { fg = term_yellow, bg = "None", gui = 'bold' },
		y = { fg = term_yellow, bg = "None", gui = 'bold' },
		z = { fg = term_black, bg = term_yellow, gui = 'bold' }
	}
}
