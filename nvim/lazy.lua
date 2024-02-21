local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ""

require("lazy").setup({
	--pretty colors
	'NvChad/nvim-colorizer.lua',
	'folke/zen-mode.nvim',
	'folke/twilight.nvim',
	--'catppuccin/nvim', { 'as': 'catppuccin'},
	{ 'mcchrish/zenbones.nvim', dependencies = 'rktjmp/lush.nvim' },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	--git,
	'airblade/vim-gitgutter',
	'tpope/vim-fugitive',

	--utilities,
	'nathanaelkane/vim-indent-guides',
	'aymericbeaumet/vim-symlink',
	'tpope/vim-repeat',
	'tpope/vim-surround',
	'mbbill/undotree',
	'ggandor/leap.nvim',
	'm4xshen/hardtime.nvim',

	--lsp,
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'L3MON4D3/LuaSnip',

	--language specific,
	'vim-scripts/nginx.vim',
	'rust-lang/rust.vim',
	'zaid/vim-rec',

	--find in files,
	'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x' },

	--status bar,
	'nvim-lualine/lualine.nvim',
	'ryanoasis/vim-devicons',
})
