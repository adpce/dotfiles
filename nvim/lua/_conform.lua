require("conform").setup({
	formatters_by_ft = {
		rust = { "rustfmt" },
		javascript = { "biome" },
		zsh = { "beautysh" },
		sh = { "beautysh" },
		fish = { "beautysh" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	}
})
