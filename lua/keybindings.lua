-- Use :map to list key bindings

-- Save and quit
vim.keymap.set('n', 's', ':w<cr>')
vim.keymap.set('n', 'Q', ':q<cr>')

-- Run VimScript on current line
vim.keymap.set('n', '<leader>D', 'yy@"')

-- Copy syntax-highlighted text to HTML
vim.g.html_number_lines = 0
vim.keymap.set('v', '<leader>C', ':TOhtml<cr>/vimCodeElement<cr>V/<\\/pre><cr>"*y:q!<cr>')

-- Format using clang-format
vim.keymap.set('n', '<leader>F', "mm:%!clang-format<cr>'mzz")

-- Telescope
vim.keymap.set('n', '<leader>fG', ':Telescope grep_string search=<c-r><c-w><cr>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fb', ':Telescope builtin<cr>')
vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<cr>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>')
