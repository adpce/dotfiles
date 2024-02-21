local map = vim.api.nvim_set_keymap

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
map('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
map('n', '<leader>fc', ':Telescope git_commits<CR>', { noremap = true, silent = true })
map('n', '<leader>fb', ':Telescope git_branches<CR>', { noremap = true, silent = true })
map('n', '<leader>fr', ':Telescope registers<CR>', { noremap = true, silent = true })
map('n', '<leader>fk', ':Telescope keymaps<CR>', { noremap = true, silent = true })
map('n', '<leader>fw', ':Telescope buffers<CR>', { noremap = true, silent = true })
map('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
map('n', '<leader>fp', ':Telescope git_files<CR>', { noremap = true, silent = true })

-- fugitive
map('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })

-- undotree
map('n', '<leader>ut', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- treesitter
map('n', '<leader>tr', ':InspectTree<CR>', { noremap = true, silent = true })

-- gitgutter
map('n', ')', '<Plug>(GitGutterNextHunk)', { noremap = true })
map('n', '(', '<Plug>(GitGutterPrevHunk)', { noremap = true })

-- zen-mode
map('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })

-- tabs
map('n', '<leader>to', ':tabnew<CR>', { noremap = true, silent = true })
map('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
map('n', '<leader>tn', ':tabnext +<CR>', { noremap = true, silent = true })
map('n', '<leader>tp', ':tabnext -<CR>', { noremap = true, silent = true })

-- everything else
map('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', 'n', 'nzz', { noremap = true })
map('n', 'N', 'Nzz', { noremap = true })
map('n', '<leader>y', '"+y', { noremap = true})
map('v', '<leader>y', '"+y', { noremap = true})
map('n', '<leader>d', '"_d', { noremap = true})
map('v', '<leader>d', '"_d', { noremap = true})

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
map('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<cr>', {})
map('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', {})
map('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', {})

