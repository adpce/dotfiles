"basic
syntax on
set number relativenumber
set wildmode=longest,list,full
set dir=~/.vim/temp
set conceallevel=2
set linebreak
set shiftwidth=4
set smarttab
set tabstop=4
set foldmethod=syntax
set termguicolors
set incsearch
set nohlsearch
"set cursorline
"set cursorcolumn
set updatetime=100
set signcolumn=yes:1
highlight Comment cterm=italic

"install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

"use vim-plug
call plug#begin()

"pretty colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"utilities
Plug 'nathanaelkane/vim-indent-guides'
Plug 'aymericbeaumet/vim-symlink'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"ale
Plug 'dense-analysis/ale'
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim', 'tag': '2.18.0'}

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

"ale
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ' '
let g:ale_javascript_quick_lint_js_executable = '/usr/local/bin/quick-lint-js'
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\	'javascript': ['quick-lint-js']
\}

let g:ale_fixers = {
\	'rust': ['rustfmt']
\}

set omnifunc=ale#completion#OmniFunc

"colorscheme
set background=dark
colorscheme catppuccin-mocha
highlight Normal ctermbg=none guibg=none
highlight SignColumn ctermbg=none guibg=none
highlight LineNr guibg=none
"highlight CursorLine cterm=bold guibg=#2B2B2B
"highlight CursorColumn cterm=bold guibg=#2B2B2B

"hexokinase
let g:Hexokinase_highlighters = [ 'foregroundfull' ]
let g:Hexokinase_optInPatterns = [
\	 'full_hex',
\	 'triple_hex',
\	 'rgb',
\	 'rgba',
\	 'hsl',
\	 'hsla',
\	 'colour_names'
\ ]
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'conf', 'vim', 'scss', 'md']

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
set laststatus=2
set noshowmode
let g:lightline = {
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' },
\ 'colorscheme':'catppuccin',
\ 'active': {
\   'left':[
\	 ['mode','paste'],
\	 ['fugitive','githunks','modified','readonly','filename']
\   ],
\	'right':[
\	 ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\    ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']
\	]
\ },
\ 'component_function': {
\   'fugitive': 'LightLineFugitive',
\	'githunks': 'LightLineGitGutter',
\   'filetype': 'FileType',
\   'fileformat': 'FileFormat'
\ }
\}
let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_infos': 'lightline#ale#infos',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\}
let g:lightline.component_type = {
\  'linter_checking': 'right',
\  'linter_infos': 'right',
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\  'linter_ok': 'right',
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

"telescope
nnoremap <Leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>

"tabs
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tn :tabnext +<CR>
nnoremap <Leader>tp :tabnext -<CR>

"everything else
nnoremap <Leader>/ :noh<CR>

"all files
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * silent! %s/\s\+$//e "remove trailing widespace from lines
autocmd BufWritePre * silent! %g/^\n\n/d "remove consecutive empty lines

"php,html
let g:PHP_vintage_case_default_indent = 1
autocmd BufWritePre *.php,*.html silent! %s/}\(\n\s\)*\(else\|elseif\){/} \2 {/ge "surround elses/elseifs in spaces
autocmd BufWritePre *.php,*.html silent! %s/if(/if (/ge "space between if and opening bracket
autocmd BufWritePre *.php,*.html silent! %s/){/) {/ge "space between closing bracket and curly brace
autocmd BufWritePre *.php,*.html silent! %s/\(\w\|\$\|\"\|\'\)\zs\(!=\|==\)/\1 \2/ge "space between operators and first argument
autocmd BufWritePre *.php,*.html silent! %s/\(==\|!=\)\(\w\|\$\|\"\|\'\)/\2 \1/ge "as above, but second argument
autocmd FileType php,html inoremap <Leader>fe foreach<Space>($value<Space>as<Space>$reference)<Space>{<CR><CR>}<Esc>ki<Tab>
autocmd FileType php,html inoremap <Leader>enc AES_ENCRYPT(:,<Space>'".constant("ENCRYPTIONKEY")."'),<Space><Esc>F:li
autocmd FileType php,html inoremap <Leader>dec AES_DECRYPT(,<Space>'".constant("ENCRYPTIONKEY")."')<Space>AS<Space>,<Space><Esc>2F(li

"groff
autocmd BufWritePost *.ms silent! :!sh '~/scripts/compile.sh'

"rust
autocmd BufWritePost *.rs :!cargo run
