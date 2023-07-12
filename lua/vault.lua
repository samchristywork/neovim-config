vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*/vault/*.md"},
  callback = function()
    vim.cmd([[set tw=80]])
    vim.cmd([[set spell]])

    vim.keymap.set('n', '<return>', function()
      vim.cmd([[normal! wF["byi[]])
      vim.cmd([[execute ":edit " . @b . ".md"]])
    end)

    vim.keymap.set('n', '<leader>v', function()
      vim.cmd([[execute ":!/home/sam/brain/generate_links"]])
    end)

    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>l', function()
      builtin.find_files({
        prompt_title = '< Insert Filename >',
        cwd = './',
        attach_mappings = function(prompt_bufnr, map)
          map('i', '<CR>', function()
            local filename = require('telescope.actions.state').get_selected_entry()
            actions.close(prompt_bufnr)

            if (filename) then
              filename.value = string.sub(filename.value, 1, -4)
              filename.value = '[' .. filename.value .. ']'

              vim.api.nvim_put({filename.value}, 'l', true, true)
            end
          end)
          return true
        end,
      })
    end)

    vim.keymap.set('n', '<leader>b', function()
      builtin.grep_string({
        prompt_title = '< Insert Filename >',
        cwd = './',
        search = vim.fn.expand('%:t:r'),
        attach_mappings = function(prompt_bufnr, map)
          map('i', '<CR>', function()
            local filename = require('telescope.actions.state').get_selected_entry()
            actions.close(prompt_bufnr)

            filename.value = string.gsub(filename.value, ":.*", "")

            vim.cmd([[execute ":edit " . "]] .. filename.value .. [["]])
          end)
          return true
        end,
      })
    end)

    vim.cmd([[syntax region LinkPattern matchgroup=Conceal start=/\[/ end=/\]/ concealends contains=@NoSpell]])
    vim.cmd([[highlight LinkPattern guifg=magenta]])

    vim.cmd([[syntax region TaggedLinkPattern matchgroup=Conceal start=/\[.\+\](/ end=/)/ concealends contains=@NoSpell]])
    vim.cmd([[highlight TaggedLinkPattern guifg=orange]])

    vim.cmd([[highlight Conceal ctermbg=none]])
    vim.cmd([[set conceallevel=2]])
    vim.cmd([[set concealcursor=nvic]])

    vim.cmd([[syntax region SemanticProsePattern matchgroup=Conceal start=/{/ end=/}/ concealends contains=@NoSpell]])
    vim.cmd([[highlight SemanticProsePattern guifg=orange]])
  end,
})
