local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
	pattern = { "*" },
	-- remove trailing widespace from lines
	command = [[silent! %s/\s\+$//e]]
})

autocmd("BufWritePre", {
	pattern = { "*" },
	-- remove consecutive empty lines
	command = [[silent! %g/^\n\n/d]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	--surround conditional connectives with spaces
	command = [[silent! :%s/)\(&&\|||\)(/) \1 (/ge]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	-- surround elses in spaces
	command = [[silent! %s/}\n\s*else\s*{/} else {/ge]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	-- surround elseifs in spaces
	command = [[silent! %s/}\n\s*elseif\s*(/} elseif (/ge]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	-- space between if and opening bracket
	command = [[silent! %s/if(/if (/ge]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	-- space between closing bracket and curly brace
	command = [[silent! %s/){/) {/ge]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	-- space between operators and first argument
	command = [[silent! %s/\(\w\|\$\|\"\|\'\|\]\)\(!=\|==\)/\1 \2/ge]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	-- as above, but second argument
	command = [[silent! %s/\(==\|!=\)\(\w\|\$\|\"\|\'\|\[\)/\1 \2/ge]]
})

autocmd("BufWritePre", {
	pattern = { "*.php", "*.html" },
	-- remove all extra whitespace between closing braces
	command = [[silent! %s/}\n\n}/}\r}/ge]]
})

autocmd("FileType", {
	pattern = { "php", "html" },
	callback = function ()
		vim.api.nvim_set_keymap("i", "<leader>fe", 'foreach<Space>($value<Space>as<Space>$reference)<Space>{<CR><CR>}<Esc>ki<Tab>', { noremap = true })
	end
})

autocmd("FileType", {
	pattern = { "php", "html" },
	callback = function ()
		vim.api.nvim_set_keymap("i", "<leader>enc", 'AES_ENCRYPT(:,<Space>\'".constant("ENCRYPTIONKEY")."\'),<Space><Esc>F:li', { noremap = true })
	end
})

autocmd("FileType", {
	pattern = { "php", "html" },
	callback = function ()
		vim.api.nvim_set_keymap("i", "<leader>dec", 'AES_DECRYPT(,<Space>\'".constant("ENCRYPTIONKEY")."\')<Space>AS<Space>,<Space><Esc>2F(li', { noremap = true})
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

autocmd("User", {
	pattern = "GoyoEnter",
	command = "Limelight"
})

autocmd("User", {
	pattern = "GoyoLeave",
	command = "Limelight!"
})

autocmd("FileType", {
	pattern = { "*" },
	command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
})
