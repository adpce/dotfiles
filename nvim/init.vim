"basic
lua require('_settings')

"install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

"use vim-plug
call plug#begin()

"pretty colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin'}
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"utilities
Plug 'nathanaelkane/vim-indent-guides'
Plug 'aymericbeaumet/vim-symlink'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'ggandor/leap.nvim'
Plug 'm4xshen/hardtime.nvim'

"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

"language specific
Plug 'vim-scripts/nginx.vim'
Plug 'rust-lang/rust.vim'
Plug 'zaid/vim-rec'

"find in files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

"status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"treesitter
lua require('_treesitter')
lua require('_lualine')
lua require('_lsp')
lua require('_catppuccin')
lua require('_colors')
lua require('_telescope')
lua require('_leap')
lua require('_twilight')
lua require('_zen-mode')
lua require('_hardtime')

"gitgutter
let g:gitgutter_sign_modified_removed = '∌'
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_hightlight_linenrs = 1

lua require('_maps')
lua require('_autocmd')

"php,html
let g:PHP_vintage_case_default_indent = 1
let g:php_htmlInStrings = 1
let g:php_sql_query = 1
let g:PHP_outdentphpescape = 0
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"
