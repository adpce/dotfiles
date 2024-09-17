local autocmd = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap

autocmd("BufWritePre", {
	pattern = { "*" },
	-- call formatter just before writing
	command = [[silent! :lua require("conform").format()]]
})

autocmd("FileType", {
	pattern = { "php", "html" },
	callback = function()
		map("i", "<leader>fe", 'foreach<Space>($value<Space>as<Space>$reference)<Space>{<CR><CR>}<Esc>ki<Tab>',
			{ noremap = true })
	end
})

autocmd("FileType", {
	pattern = { "php", "html" },
	callback = function()
		map("i", "<leader>enc", 'AES_ENCRYPT(:,<Space>\'".constant("ENCRYPTIONKEY")."\'),<Space><Esc>F:li',
			{ noremap = true })
	end
})

autocmd("FileType", {
	pattern = { "php", "html" },
	callback = function()
		map("i", "<leader>dec",
			'AES_DECRYPT(,<Space>\'".constant("ENCRYPTIONKEY")."\')<Space>AS<Space>,<Space><Esc>2F(li',
			{ noremap = true })
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

autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function()
		map('n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true })
		map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { noremap = true })
		map('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { noremap = true })
		map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { noremap = true })
		map('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { noremap = true })
		map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', { noremap = true })
		map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { noremap = true })
		map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { noremap = true })
		map('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { noremap = true })
		map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', { noremap = true })
	end
})
