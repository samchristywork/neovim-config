vim.keymap.set('v', '<leader>s', function()
  vim.cmd(':norm "zy')
  vim.cmd(':let g:snippetfilename=input("Enter filename for snippet: ")')
  local filename = vim.g.snippetfilename
  vim.cmd(':call writefile(getreg("z", 1, 1), "/home/sam/snippets/' .. filename .. '", "a")')
end)

vim.keymap.set('n', '<leader>r', function()
  require('telescope.builtin').find_files({
    prompt_title = '< Insert Filename >',
    cwd = '~/snippets',
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<CR>', function()
        local filename = require('telescope.actions.state').get_selected_entry()
        require('telescope.actions').close(prompt_bufnr)

        vim.cmd(':r ~/snippets/' .. filename.value)
      end)
      return true
    end,
  })
end)
