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
	defaults = {
		lazy = true,
		version = false
	},
	--pretty colors
	'NvChad/nvim-colorizer.lua',
	'folke/zen-mode.nvim',
	'folke/twilight.nvim',
	{ "rose-pine/neovim",                name = "rose-pine" },
	{ 'folke/tokyonight.nvim',           lazy = false,                     priority = 1000 },
	{ 'catppuccin/nvim',                 name = 'catppuccin' },
	{ 'mcchrish/zenbones.nvim',          dependencies = 'rktjmp/lush.nvim' },
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
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{ 'neovim/nvim-lspconfig', dependencies = { 'hrsh7th/cmp-nvim-lsp' } },
	{ 'hrsh7th/nvim-cmp',      dependencies = { 'L3MON4D3/LuaSnip' } },

	--language specific,
	'vim-scripts/nginx.vim',
	'rust-lang/rust.vim',
	'zaid/vim-rec',

	--find in files,
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } },

	--status bar,
	'nvim-lualine/lualine.nvim',
})
