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
