local map = vim.api.nvim_set_keymap

-- telescope
map('n', '<leader>fb', ':Telescope git_branches<CR>', { noremap = true, silent = true })
map('n', '<leader>fc', ':Telescope git_commits<CR>', { noremap = true, silent = true })
map('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
map('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
map('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
map('n', '<leader>fk', ':Telescope keymaps<CR>', { noremap = true, silent = true })
map('n', '<leader>fs', ':Telescope grep_string<CR>', { noremap = true, silent = true })
map('n', '<leader>fp', ':Telescope git_files<CR>', { noremap = true, silent = true })
map('n', '<leader>fr', ':Telescope registers<CR>', { noremap = true, silent = true })
map('n', '<leader>fw', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- fugitive
map('n', '<leader>gts', ':Git<CR>', { noremap = true, silent = true })
map('n', '<leader>gtd', ':Gdiffsplit<CR>', { noremap = true, silent = true })

-- undotree
map('n', '<leader>ut', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- treesitter
map('n', '<leader>tr', ':InspectTree<CR>', { noremap = true, silent = true })

-- gitgutter
map('n', ')', '<Plug>(GitGutterNextHunk)', { noremap = true })
map('n', '(', '<Plug>(GitGutterPrevHunk)', { noremap = true })

-- zen-mode
map('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })

-- flash
map("n", '<leader>s', '<cmd>lua require("flash").jump()<CR>', { noremap = true, silent = true })
map("n", '<leader>S', '<cmd>lua require("flash").treesitter()<CR>', { noremap = true, silent = true })
map("o", '<leader>r', '<cmd>lua require("flash").remote()<CR>', { noremap = true, silent = true })
map("o", '<leader>R', '<cmd>lua require("flash").treesitter_search()<CR>', { noremap = true, silent = true })
map("n", "<C-s>", '<cmd>lua require("flash").toggle()<CR>', { noremap = true, silent = true })

-- tabs
map('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
map("n", "<leader>tf", ":tabfirst<CR>", { noremap = true, silent = true })
map("n", "<leader>tl", ":tablast<CR>", { noremap = true, silent = true })
map('n', '<leader>tn', ':tabnext<CR>', { noremap = true, silent = true })
map('n', '<leader>to', ':tabnew<CR>', { noremap = true, silent = true })
map('n', '<leader>tp', ':tabprevious<CR>', { noremap = true, silent = true })

-- buffers
map("n", "<leader>bc", ":bdelete<CR>", { noremap = true, silent = true })
map("n", "<leader>bf", ":bfirst<CR>", { noremap = true, silent = true })
map("n", "<leader>bl", ":blast<CR>", { noremap = true, silent = true })
map("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<leader>bp", ":bprev<CR>", { noremap = true, silent = true })

-- files
map("n", "QQ", ":q!<CR>", { noremap = true, silent = true })
map("n", "WW", ":w!<CR>", { noremap = true, silent = true })

-- everything else
map('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', 'n', 'nzz', { noremap = true })
map('n', 'N', 'Nzz', { noremap = true })
map('n', '<leader>y', '"+y', { noremap = true })
map('v', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>d', '"_d', { noremap = true })
map('v', '<leader>d', '"_d', { noremap = true })
map('v', 'J', ":m '>+1<CR>gv=gv'", { noremap = true })
map('v', 'K', ":m '>-2<CR>gv=gv'", { noremap = true })

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
map('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>', {})
map('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {})
map('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', {})
