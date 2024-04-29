local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local util = require("lspconfig.util")

local default_setup = function(server)
	require('lspconfig')[server].setup({
		capabilities = lsp_capabilities,
	})
end

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"intelephense"
	},
	handlers = {
		default_setup,
	},
})

require 'lspconfig'.intelephense.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		intelephense = {
			files = {
				exclude = {
					os.getenv('HOME') .. "/hbk/pb/tcpdf/fonts/*"
				},
			}
		}
	}
}

require 'lspconfig'.biome.setup {
	root_dir = function(fname)
		return util.root_pattern("biome.json", "biome.jsonc")(fname)
			or util.find_package_json_ancestor(fname)
			or util.find_node_modules_ancestor(fname)
			or util.find_git_ancestor(fname)
	end,
}

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	mapping = cmp.mapping.preset.insert({
		-- Enter key confirms completion item
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Ctrl + space triggers completion menu
		['<C-Space>'] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})
