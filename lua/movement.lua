-- Move cursor
vim.keymap.set('', 'J', '5j')
vim.keymap.set('', 'K', '5k')
vim.keymap.set('', 'H', '10h')
vim.keymap.set('', 'L', '10l')

-- Move between buffers
vim.keymap.set('n', 'e', ':bn<cr>')
vim.keymap.set('n', 'E', ':bp<cr>')

-- Move lines
vim.keymap.set('v', 's', ':sort<cr>')
