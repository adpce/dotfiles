"basic
lua require('_settings')
lua require('_lazy')

"lua require('_colorizer')
lua require('_treesitter')
lua require('_lualine')
lua require('_lsp')
"lua require('_catppuccin')
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
