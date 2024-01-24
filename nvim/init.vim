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
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"treesitter
lua require('_treesitter')

"ale
let g:ale_lint_on_text_changed = 'always'
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ' '
let g:ale_javascript_quick_lint_js_executable = '/usr/local/bin/quick-lint-js'
let g:airline#extensions#ale#enabled = 1

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
highlight GitGutterAdd guifg=#009900
highlight GitGutterChange guifg=#BBBB00
highlight GitGutterDelete guifg=#FF2222
highlight GitGutterChangeDelete guifg=#FF6600
nnoremap ) <Plug>(GitGutterNextHunk)
nnoremap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_sign_modified_removed = '∌'
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_hightlight_linenrs = 1

"limelight
let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_conceal_guifg = '#444444'

"lightline
let g:lightline = {
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' },
\ 'colorscheme':'deus',
\ 'active': {
\   'left':[
\	 ['mode','paste'],
\	 ['fugitive','githunks','modified','readonly','filename', 'charvaluehex']
\   ],
\	'right':[
\	 ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\    ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']
\	]
\ },
\ 'component': {
\	'charvaluehex': '0x%B'
\ },
\ 'component_function': {
\   'fugitive': 'LightLineFugitive',
\	'githunks': 'LightLineGitGutter',
\   'filetype': 'FileType',
\   'fileformat': 'FileFormat'
\ },
\ 'component_expand': {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_infos': 'lightline#ale#infos',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ },
\ 'component_type': {
\  'linter_checking': 'right',
\  'linter_infos': 'right',
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\  'linter_ok': 'right',
\ }
\}
function! LightLineFugitive()
  return (FugitiveHead() != "") ? FugitiveHead() . ' ' : ''
endfunction
function! LightLineGitGutter()
  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
	return ''
  endif
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction
function! FileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! FileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) . ' ' : ''
endfunction

lua require('_maps')
lua require('_autocmd')

"all files

"php,html
let g:PHP_vintage_case_default_indent = 1
let g:php_htmlInStrings = 1
let g:php_sql_query = 1
let g:PHP_outdentphpescape = 0
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"
