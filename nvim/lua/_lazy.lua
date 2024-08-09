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
	rocks = {
		enabled = false
	},
	defaults = {
		lazy = true,
		version = false
	},
	--pretty colors
	'NvChad/nvim-colorizer.lua',
	'folke/zen-mode.nvim',
	'folke/twilight.nvim',
	{ 'folke/tokyonight.nvim',           lazy = false,       priority = 1000 },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	--git,
	'airblade/vim-gitgutter',
	'tpope/vim-fugitive',

	--utilities,
	'm4xshen/hardtime.nvim',

	--lsp,
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{ 'neovim/nvim-lspconfig',         dependencies = 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp',              dependencies = 'L3MON4D3/LuaSnip' },

	--find in files,
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x',                     dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } },
	'folke/flash.nvim',

	--status bar,
	'nvim-lualine/lualine.nvim',
})
