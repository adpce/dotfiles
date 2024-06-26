require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"bash", "c", "css", "gitcommit", "git_config", "html", "javascript", "json", "lua", "markdown", "markdown_inline", "php", "php_only", "scss", "sql", "ssh_config", "rust", "vim", "vimdoc", "query"
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},

	incremental_selection = {
		enable = true
	},

	indent = {
		enable = true
	}
}
