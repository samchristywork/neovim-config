-- Use :map to list key bindings

-- Save and quit
vim.keymap.set('n', 's', ':w<cr>')
vim.keymap.set('n', 'Q', ':q<cr>')

-- Run VimScript on current line
vim.keymap.set('n', 'D', 'yy@"')

-- Copy syntax-highlighted text to HTML
vim.g.html_number_lines = 0
vim.keymap.set('v', 'C', ':TOhtml<cr>/vimCodeElement<cr>V/<\\/pre><cr>"*y:q!<cr>')

-- Format using clang-format
vim.keymap.set('n', 'F', "mm:%!clang-format<cr>'mzz")

-- Telescope
vim.keymap.set('n', 'fG', ':Telescope grep_string search=<c-r><c-w><cr>')
vim.keymap.set('n', 'fb', ':Telescope buffers<cr>')
vim.keymap.set('n', 'fb', ':Telescope builtin<cr>')
vim.keymap.set('n', 'fc', ':Telescope colorscheme<cr>')
vim.keymap.set('n', 'ff', ':Telescope find_files<cr>')
vim.keymap.set('n', 'fg', ':Telescope live_grep<cr>')
vim.keymap.set('n', 'fh', ':Telescope help_tags<cr>')
