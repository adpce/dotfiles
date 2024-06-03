vim.opt.background = 'dark'
vim.opt.conceallevel = 2
vim.opt.dir = os.getenv('HOME') .. "/.vim/temp"
vim.opt.foldmethod = 'syntax'
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.redrawtime = 10000
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes:1'
vim.opt.smarttab = true
vim.opt.synmaxcol = 0
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list,full"
vim.cmd [[highlight Comment cterm=italic]]

-- lightline
vim.opt.laststatus = 2
vim.opt.showmode = false

-- gitgutter
vim.g.gitgutter_sign_modified_removed = '∌'
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_hightlight_linenrs = 1
