vim.g.ale_lint_on_text_changed = 'always'
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_autoimport = 1
vim.g.ale_sign_column_always = 1
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = ' '
vim.g.ale_javascript_quick_lint_js_executable = '/usr/local/bin/quick-lint-js'

vim.g.ale_linters = {
	javascript = {'quick-lint-js'},
	lua = {'luac'},
	json = {'jq'},
	php = {'php'},
	rust = {'rustc'}
}
