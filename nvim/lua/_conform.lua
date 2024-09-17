require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		javascript = { "biome" },
		php = { "php-cs-fixer" }
	},
	default_format_opts = {
		lsp_format = "fallback",
	}
})
