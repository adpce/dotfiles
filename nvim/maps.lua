vim.g.mapleader = ""

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

-- fugitive
map('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })

-- undotree
map('n', '<leader>ut', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- treesitter
map('n', '<leader>tr', ':InspectTree<CR>', { noremap = true, silent = true })

-- gitgutter
map('n', ')', '<Plug>(GitGutterNextHunk)', { noremap = true })
map('n', '(', '<Plug>(GitGutterPrevHunk)', { noremap = true })

-- tabs
map('n', '<leader>to', ':tabnew<CR>', { noremap = true, silent = true })
map('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
map('n', '<leader>tn', ':tabnext +<CR>', { noremap = true, silent = true })
map('n', '<leader>tp', ':tabnext -<CR>', { noremap = true, silent = true })

-- everything else
map('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true })
