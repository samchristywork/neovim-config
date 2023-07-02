-- Use :map to list key bindings

-- Telescope
vim.keymap.set('n', '<leader>fG', ':Telescope grep_string search=<c-r><c-w><cr>', {desc = "Search for word under cursor"})
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>',                       {desc = "Search for buffers"})
vim.keymap.set('n', '<leader>fb', ':Telescope builtin<cr>',                       {desc = "Search for builtin commands"})
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>',                    {desc = "Search for files"})
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>',                     {desc = "Search for text"})
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>',                     {desc = "Search for help tags"})

vim.keymap.set('n', '<leader>fc', function()
  vim.cmd(':Telescope colorscheme');
end, {desc = "Search for colorschemes"})
vim.keymap.set('n', '<leader>fC', function()
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
end, {desc = "Reset background to be transparent"})

-- Miscellanous
vim.keymap.set('n', '<F6>',      ':DiffviewFileHistory %<cr>',                             {desc = "Open file history"})
vim.keymap.set('n', '<leader>D', 'yy@"',                                                   {desc = "Run VimScript on current line"})
vim.keymap.set('n', '<leader>u', '<c-w>n<c-w>L:term sc-im<cr>:set nonu<cr>',               {desc = "Open a terminal with sc-im in a new window"})
vim.keymap.set('n', 'n',         'nzz',                                                    {desc = "Auto-center when searching for matches"})
vim.keymap.set('n', 's',         ':w<cr>',                                                 {desc = "Save using s"})
vim.keymap.set('t', '<Esc>',     '<C-\\><C-n>',                                            {desc = "Exit terminal insert mode using escape"})
vim.keymap.set('v', '<leader>C', ':TOhtml<cr>/vimCodeElement<cr>V/<\\/pre><cr>"*y:q!<cr>', {desc = "Copy syntax-highlighted text to HTML"})
vim.keymap.set('n', '<c-d>',     '<c-d>zz',                                                {desc = "Scroll down half a page"})
vim.keymap.set('n', '<c-u>',     '<c-u>zz',                                                {desc = "Scroll up half a page"})

-- Bindings for C/C++
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.cpp"},
  callback = function()
    vim.keymap.set('n', '<F5>', ':make run<cr>', {desc = "Run make"})
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

-- EasyMotion
-- <Leader>f{char} to move to {char}
vim.api.nvim_set_keymap('n', '<leader>mf', '<Plug>(easymotion-bd-f)', {})
vim.api.nvim_set_keymap('x', '<leader>mf', '<Plug>(easymotion-overwin-f)', {})

-- s{char}{char} to move to {char}{char}
vim.api.nvim_set_keymap('n', '<leader>ms', '<Plug>(easymotion-overwin-f2)', {})

-- Move to line
vim.api.nvim_set_keymap('n', '<leader>ml', '<Plug>(easymotion-bd-jk)', {})
vim.api.nvim_set_keymap('x', '<leader>ml', '<Plug>(easymotion-overwin-line)', {})

-- Move to word
vim.api.nvim_set_keymap('n', '<leader>mw', '<Plug>(easymotion-bd-w)', {})
vim.api.nvim_set_keymap('x', '<leader>mw', '<Plug>(easymotion-overwin-w)', {})

-- Print out current date
vim.api.nvim_set_keymap('n', '<F5>', ':read !date "+\\%Y-\\%m-\\%d"<CR>', {})
vim.api.nvim_set_keymap('n', '<S-F5>', ':read !date "+\\%Y-\\%m-\\%d \\%H:\\%M:\\%S"<CR>', {})
vim.api.nvim_set_keymap('n', '<C-S-F5>', ':read !date "+\\%s"<CR>', {})
