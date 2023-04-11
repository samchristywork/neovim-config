-- Use :map to list key bindings

-- Save and quit
vim.keymap.set('n', 's', ':w<cr>', {desc = "Save using s"})
vim.keymap.set('n', 'Q', ':q<cr>', {desc = "Quit using Q"})

vim.keymap.set('n', '<leader>D', 'yy@"', {desc = "Run VimScript on current line"})

vim.g.html_number_lines = 0
vim.keymap.set('v', '<leader>C', ':TOhtml<cr>/vimCodeElement<cr>V/<\\/pre><cr>"*y:q!<cr>', {desc = "Copy syntax-highlighted text to HTML"})

-- Telescope
vim.keymap.set('n', '<leader>fG', ':Telescope grep_string search=<c-r><c-w><cr>', {desc = "Search for word under cursor"})
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', {desc = "Search for buffers"})
vim.keymap.set('n', '<leader>fb', ':Telescope builtin<cr>', {desc = "Search for builtin commands"})
vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<cr>', {desc = "Search for colorschemes"})
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', {desc = "Search for files"})
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>', {desc = "Search for text"})
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', {desc = "Search for help tags"})

-- " Ctrl-\, Ctrl-n to get out of insert mode
vim.keymap.set('n', '<leader>u', '<c-w>n<c-w>L:term sc-im<cr>:set nonu<cr>', {desc = "Open a terminal with sc-im in a new window"})

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {desc = "Exit terminal insert mode using escape"})

vim.keymap.set('n', '<F6>', ':DiffviewFileHistory %<cr>', {desc = "Open file history"})

-- Bindings for C/C++
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.cpp"},
  callback = function()
    vim.keymap.set('n', '<leader>F', "mm:%!clang-format<cr>'mzz", {desc = "Format using clang-format"})
  end,
})

-- Bindings for Rust
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.rs"},
  callback = function()
    vim.keymap.set('n', '<leader>F', ":!cargo fmt<cr>", {desc = "Format using cargo fmt"})
  end,
})
