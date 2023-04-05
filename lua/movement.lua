-- Move cursor
vim.keymap.set('', 'J', 'jjjjj')
vim.keymap.set('', 'K', 'kkkkk')
vim.keymap.set('', 'H', 'hhhhhhhhhh')
vim.keymap.set('', 'L', 'llllllllll')

-- Move between buffers
vim.keymap.set('n', 'e', ':bn<cr>')
vim.keymap.set('n', 'E', ':bp<cr>')

-- Move lines
vim.keymap.set('v', 's', ':sort<cr>')
