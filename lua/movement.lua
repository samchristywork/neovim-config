-- Move cursor
vim.keymap.set('', 'J', '5j')
vim.keymap.set('', 'K', '5k')
vim.keymap.set('', 'H', '10h')
vim.keymap.set('', 'L', '10l')
vim.keymap.set('', '<c-n>', ':cnext<cr>')
vim.keymap.set('', '<c-p>', ':cprevious<cr>')

-- Move between buffers
vim.keymap.set('n', 'e', ':bn<cr>')
vim.keymap.set('n', 'E', ':bp<cr>')

-- Move lines
vim.keymap.set('v', 's', ':sort<cr>')

-- Scroll
vim.keymap.set('n', '<', '5<c-e>')
vim.keymap.set('n', '>', '5<c-y>')

-- Navigate file by percentage
vim.keymap.set('n', 'g1', ':normal! 10%<cr>zz')
vim.keymap.set('n', 'g2', ':normal! 20%<cr>zz')
vim.keymap.set('n', 'g3', ':normal! 30%<cr>zz')
vim.keymap.set('n', 'g4', ':normal! 40%<cr>zz')
vim.keymap.set('n', 'g5', ':normal! 50%<cr>zz')
vim.keymap.set('n', 'g6', ':normal! 60%<cr>zz')
vim.keymap.set('n', 'g7', ':normal! 70%<cr>zz')
vim.keymap.set('n', 'g8', ':normal! 80%<cr>zz')
vim.keymap.set('n', 'g9', ':normal! 90%<cr>zz')
