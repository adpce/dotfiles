vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamedplus'
vim.opt.conceallevel = 2
vim.opt.dir = (os.getenv('HOME') and os.getenv('HOME') .. "/.vim/temp" or os.getenv('USERPROFILE') .. "/.vim/temp")
vim.opt.foldmethod = 'syntax'
vim.opt.guicursor = ''
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.redrawtime = 10000
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes:1'
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.synmaxcol = 0
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list,full"

-- lightline
vim.opt.laststatus = 2
vim.opt.showmode = false

vim.cmd [[highlight Comment cterm=italic]]

-- gitgutter
vim.g.gitgutter_sign_modified_removed = '∌'
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_hightlight_linenrs = 1
