local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local function commands_picker()
  local commands = {
    { value = "GitGutter",         ordinal = "GitGutter",         display = "GitGutter" },
    { value = "cclose",            ordinal = "cclose",            display = "cclose" },
    { value = "norm yyp",          ordinal = "norm yyp",          display = "norm yyp" },
    { value = "GitGutterNextHunk", ordinal = "GitGutterNextHunk", display = "GitGutterNextHunk" },
    {
      value = "TSTextobjectGotoNextStart @function.outer",
      ordinal = "TSTextobjectGotoNextStart @function.outer",
      display = "TSTextobjectGotoNextStart @function.outer"
    },
  }

  pickers.new({}, {
    prompt_title = "Custom Commands",
    finder = finders.new_table({
      results = commands,
      entry_maker = function(entry)
        return {
          value = entry.value,
          display = entry.display,
          ordinal = entry.ordinal,
          execute_command = function()
            vim.cmd(entry.value)
          end,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<CR>', function()
        local selection = require('telescope.actions.state').get_selected_entry()
        require('telescope.actions').close(prompt_bufnr)
        selection.execute_command()
      end)
      map('n', '<CR>', function()
        local selection = require('telescope.actions.state').get_selected_entry()
        require('telescope.actions').close(prompt_bufnr)
        selection.execute_command()
      end)
      return true
    end,
  }):find()
end

vim.api.nvim_create_user_command('ListCommands', commands_picker, {})

vim.api.nvim_set_keymap('n', '<leader><leader>', ':ListCommands<CR>', { noremap = true, silent = true })

vim.cmd('copen')
vim.cmd('wincmd L')
vim.cmd('vertical resize 40')

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    vim.cmd('cclose')
  end,
})

-- Function to populate the quickfix list with lines not starting with whitespace
local function populate_quickfix_non_whitespace()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local qf_items = {}

  for i, line in ipairs(lines) do
    if not line:match("^%s") and line ~= "" and line ~= "}" then
      table.insert(qf_items, {
        bufnr = bufnr,
        lnum = i,
        text = line
      })
    end
  end

  vim.fn.setqflist(qf_items)
end

vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    populate_quickfix_non_whitespace()
  end,
})
