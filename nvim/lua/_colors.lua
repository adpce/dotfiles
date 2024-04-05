local hl = vim.api.nvim_set_hl

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "default",
	callback = function()
		vim.opt.background = 'dark'
		hl(0, "Normal", { bg = "none" })
		hl(0, "NormalFloat", { bg = "none" })
		hl(0, "SignColumn", { bg = "none" })
		hl(0, "LineNr", { bg = "none" })
	end
})

vim.cmd.colorscheme "default"

-- gitgutter
hl(0, "GitGutterAdd", { fg = "#009900" })
hl(0, "GitGutterChange", { fg = "#BBBB00" })
hl(0, "GitGutterDelete", { fg = "#FF2222" })
hl(0, "GitGutterChangeDelete", { fg = "#FF6600" })

require("colorizer").setup{
	filetypes = { 'css', 'scss', 'html' },
	user_default_options = {
		mode = "foreground"
	}
}
