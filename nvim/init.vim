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
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'folke/tokyonight.nvim',
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

"ale
Plug 'dense-analysis/ale'
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim', 'tag': '3.1.0'}

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

"ale
let g:ale_lint_on_text_changed = 'always'
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ' '
let g:ale_javascript_quick_lint_js_executable = '/usr/local/bin/quick-lint-js'

let g:ale_linters = {
\	'javascript': ['quick-lint-js'],
\	'lua': ['luac'],
\	'json': ['jq'],
\	'php': ['php'],
\	'rust': ['rustc']
\}

set omnifunc=ale#completion#OmniFunc

lua require('_catppuccin')
lua require('_colors')
lua require('_telescope')
lua require('_leap')

"hexokinase
let g:Hexokinase_highlighters = [ 'foregroundfull' ]
let g:Hexokinase_optInPatterns = [
\	 'full_hex',
\	 'triple_hex',
\	 'rgb',
\	 'rgba',
\	 'hsl',
\	 'hsla'
\ ]

"gitgutter
let g:gitgutter_sign_modified_removed = '∌'
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_hightlight_linenrs = 1

"limelight
let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_conceal_guifg = '#444444'

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
