local cmd = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap

-- Hide the (real) cursor when leaping, and restore it afterwards.
cmd('User', {
	pattern = 'LeapEnter',
	callback = function()
		vim.cmd.hi('Cursor', 'blend=100')
		vim.opt.guicursor:append { 'a:Cursor/lCursor' }
	end,
})

cmd('User', {
	pattern = 'LeapLeave',
	callback = function()
		vim.cmd.hi('Cursor', 'blend=0')
		vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
	end,
})

map('n', '<Leader>s', '<Plug>(leap-forward)', { noremap = true })
map('n', '<Leader>S', '<Plug>(leap-backward)', { noremap = true })
