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
		"intelephense", "biome"
	},
	handlers = {
		default_setup,
	},
})

require 'lspconfig'.intelephense.setup {
	cmd = { 'intelephense', '--stdio' },
	filetypes = { 'php' },
	on_attach = on_attach,
	capabilities = lsp_capabilities,
	settings = {
		intelephense = {
			files = {
				exclude = {
					os.getenv('HOME') .. "/hbk/pb/tcpdf/fonts/*"
				},
			},
			completion = {
				fullyQualifyGlobalConstantsAndFunctions = {
					true
				},
				insertuseDeclaration = {
					true
				}
			},
			stubs = {
				"apache",
				"bcmath",
				"bz2",
				"calendar",
				"com_dotnet",
				"Core",
				"ctype",
				"curl",
				"date",
				"dba",
				"dom",
				"enchant",
				"exif",
				"FFI",
				"fileinfo",
				"filter",
				"fpm",
				"ftp",
				"gd",
				"gettext",
				"gmp",
				"hash",
				"iconv",
				"imap",
				"intl",
				"json",
				"ldap",
				"libxml",
				"mbstring",
				"meta",
				"mysqli",
				"oci8",
				"odbc",
				"openssl",
				"pcntl",
				"pcre",
				"PDO",
				"pdo_ibm",
				"pdo_mysql",
				"pdo_pgsql",
				"pdo_sqlite",
				"pgsql",
				"Phar",
				"posix",
				"pspell",
				"readline",
				"Reflection",
				"session",
				"shmop",
				"SimpleXML",
				"snmp",
				"soap",
				"sockets",
				"sodium",
				"SPL",
				"sqlite3",
				"standard",
				"superglobals",
				"sysvmsg",
				"sysvsem",
				"sysvshm",
				"tidy",
				"tokenizer",
				"xml",
				"xmlreader",
				"xmlrpc",
				"xmlwriter",
				"xsl",
				"Zend OPcache",
				"zip",
				"zlib",
				"wordpress"
			},
		}
	}
}

require 'lspconfig'.biome.setup {
	cmd = { 'biome', 'lsp-proxy' },
	filetypes = {
		'javascript',
		'javascriptreact',
		'json',
		'jsonc',
		'typescript',
		'typescript.tsx',
		'typescriptreact',
		'astro',
		'svelte',
		'vue',
		'css'
	},
	single_file_support = false,
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
