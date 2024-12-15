local autocmd = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap

autocmd("BufWritePre", {
	pattern = { "*" },
	-- call formatter just before writing
	callback = function()
		require("conform").format()
	end
})

autocmd("FileType", {
	pattern = { "php", "html" },
	callback = function()
		map("i", "<leader>fe", 'foreach<Space>($value<Space>as<Space>$reference)<Space>{<CR><CR>}<Esc>ki<Tab>',
			{ silent = true, noremap = true })
		map("i", "<leader>enc", 'AES_ENCRYPT(:,<Space>\'".constant("ENCRYPTIONKEY")."\'),<Space><Esc>F:li',
			{ silent = true, noremap = true })
		map("i", "<leader>dec",
			'AES_DECRYPT(,<Space>\'".constant("ENCRYPTIONKEY")."\')<Space>AS<Space>,<Space><Esc>2F(li',
			{ silent = true, noremap = true })
	end
})

autocmd("BufWritePost", {
	pattern = "*.ms",
	command = [[silent! :!sh '~/scripts/compile.sh']]
})

autocmd("BufWritePost", {
	pattern = "*.rs",
	command = ":!cargo run"
})

autocmd("FileType", {
	pattern = { "*" },
	command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
})

autocmd("FileType", {
	pattern = { "text", "markdown" },
	command = ":setlocal spell spelllang=en_gb"
})

autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function()
		map('n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<cr>', { silent = true, noremap = true })
		map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { silent = true, noremap = true })
		map('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { silent = true, noremap = true })
		map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { silent = true, noremap = true })
		map('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { silent = true, noremap = true })
		map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', { silent = true, noremap = true })
		map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { silent = true, noremap = true })
		map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { silent = true, noremap = true })
		map('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { silent = true, noremap = true })
		map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', { silent = true, noremap = true })
		map('n', '<F5>',
			'<cmd>lua vim.lsp.buf.code_action({filter = function(x) return x.isPreferred end, apply = true})<cr>',
			{ noremap = true, silent = true })
	end
})
