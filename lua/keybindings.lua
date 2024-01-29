-- Use :map to list key bindings

-- Telescope
vim.keymap.set('n', '<leader>fG', ':Telescope grep_string search=<c-r><c-w><cr>',
  { desc = "Search for word under cursor" })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', { desc = "Search for buffers" })
vim.keymap.set('n', '<leader>fb', ':Telescope builtin<cr>', { desc = "Search for builtin commands" })
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', { desc = "Search for files" })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>', { desc = "Search for text" })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = "Search for help tags" })
vim.keymap.set('n', '<leader>ft', ':Telescope<cr>', { desc = "Search for everything" })

-- Insert filename
vim.keymap.set('n', '<leader>fn', function()
  require('telescope.builtin').find_files({
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden', '--glob', '!.git/*' },
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local entry = require('telescope.actions.state').get_selected_entry()
        require('telescope.actions').close(prompt_bufnr)
        vim.api.nvim_put({ entry.value }, '', true, true)
      end)
      return true
    end,
  })
end, { desc = "Insert filename under cursor" })

-- Search for files in git repo
vim.keymap.set('n', '<leader>fj', function()
  require('telescope.builtin').find_files({
    find_command = { 'git', 'ls-files' },
    -- open file in a new buffer
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local entry = require('telescope.actions.state').get_selected_entry()
        require('telescope.actions').close(prompt_bufnr)
        vim.cmd('e ' .. entry.value)
      end)
      return true
    end,
  })
end, { desc = "Search for Git files and open" })

-- Color schemes
vim.keymap.set('n', '<leader>fc', function()
  vim.cmd(':Telescope colorscheme');
end, { desc = "Search for colorschemes" })

vim.keymap.set('n', '<leader>fC', function()
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
end, { desc = "Reset background to be transparent" })

-- Miscellanous
vim.keymap.set('n', '<F6>', ':DiffviewFileHistory %<cr>', { desc = "Open file history" })
vim.keymap.set('n', '<leader>D', 'yy@"', { desc = "Run VimScript on current line" })
vim.keymap.set('n', '<leader>u', '<c-w>n<c-w>L:term sc-im<cr>:set nonu<cr>', { desc = "Open a terminal with sc-im" })
vim.keymap.set('n', 'n', 'nzz', { desc = "Auto-center when searching for matches" })
vim.keymap.set('n', 's', ':w<cr>', { desc = "Save using s" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "Exit terminal insert mode using escape" })
vim.keymap.set('v', '<leader>C', ':TOhtml<cr>/vimCodeElement<cr>V/<\\/pre><cr>"*y:q!<cr>', { desc = "Copy code to HTML" })
vim.keymap.set('n', '<c-d>', '<c-d>zz', { desc = "Scroll down half a page" })
vim.keymap.set('n', '<c-u>', '<c-u>zz', { desc = "Scroll up half a page" })
vim.keymap.set('n', '<F4>', ':make run<cr>', { desc = "Run make" })

-- Print out current date
vim.api.nvim_set_keymap('n', '<F5>', ':read !date "+\\%Y-\\%m-\\%d"<CR>', {})
vim.api.nvim_set_keymap('n', '<S-F5>', ':read !date "+\\%Y-\\%m-\\%d \\%H:\\%M:\\%S"<CR>', {})
vim.api.nvim_set_keymap('n', '<C-S-F5>', ':read !date "+\\%s"<CR>', {})

-- Buffer management
vim.api.nvim_set_keymap('n', '<leader>bo', ':%bd|e#|bn|bd<cr>', { desc = "Close all buffers except current one" })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<cr>', { desc = "Close current buffer" })

-- Open current file in Firefox
vim.api.nvim_set_keymap('n', '<leader>o', ':!firefox %<cr>', { desc = "Open current file in Firefox" })
vim.api.nvim_set_keymap('n', '<leader>O', ':!firefox --new-window %<cr>',
  { desc = "Open current file in Firefox in a new window" })

function Search_all_files()
  local search_string = vim.fn.input("Enter search string: ")
  local cmd = string.format(":vimgrep /%s/ `find`", search_string)
  vim.fn.setqflist({}, ' ')
  vim.cmd('cclose')
  vim.cmd(cmd)
  vim.cmd('copen')
  vim.cmd('wincmd L')
  vim.cmd('vertical resize 40')
end

function Search_git_files()
  local search_string = vim.fn.input("Enter search string: ")
  local cmd = string.format(":vimgrep /%s/ `git ls-files`", search_string)
  vim.fn.setqflist({}, ' ')
  vim.cmd('cclose')
  vim.cmd(cmd)
  vim.cmd('copen')
  vim.cmd('wincmd L')
  vim.cmd('vertical resize 40')
end

vim.keymap.set('n', '<leader>s', function()
  Search_all_files()
end, { desc = "Search through files using vimgrep" })
