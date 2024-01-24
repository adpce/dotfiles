local hl = vim.api.nvim_set_hl

vim.opt.background = 'dark'
hl(0, "Normal", { bg = "none" })
hl(0, "NormalFloat", { bg = "none" })
hl(0, "SignColumn", { bg = "none" })
hl(0, "LineNr", { bg = "none" })

--gitgutter
hl(0, "GitGutterAdd", { fg = "#009900" })
hl(0, "GitGutterChange", { fg = "#BBBB00" })
hl(0, "GitGutterDelete", { fg = "#FF2222" })
hl(0, "GitGutterChangeDelete", { fg = "#FF6600" })
