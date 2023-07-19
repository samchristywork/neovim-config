function HighlightSyntax()
  vim.fn.matchadd("HeadingPattern", [[\v^#+ .*]])
  vim.cmd([[highlight HeadingPattern guifg=#e69999]])

  vim.cmd([[highlight NumberLevel1 guifg=red]])
  vim.cmd([[highlight NumberLevel2 guifg=orange]])
  vim.cmd([[highlight NumberLevel3 guifg=yellow]])
  vim.cmd([[highlight NumberLevel4 guifg=green]])
  vim.cmd([[highlight NumberLevel5 guifg=blue]])
  vim.cmd([[highlight NumberLevel6 guifg=purple]])

  vim.fn.matchadd("NumberLevel1", [[\v^\d+:]])
  vim.fn.matchadd("NumberLevel2", [[\v^  \d+:]])
  vim.fn.matchadd("NumberLevel3", [[\v^    \d+:]])
  vim.fn.matchadd("NumberLevel4", [[\v^      \d+:]])
  vim.fn.matchadd("NumberLevel5", [[\v^        \d+:]])
  vim.fn.matchadd("NumberLevel6", [[\v^          \d+:]])

  vim.cmd([[syntax region LinkPattern matchgroup=Conceal start=/\[/ end=/\]/ concealends contains=@NoSpell]])
  vim.cmd([[highlight LinkPattern guifg=magenta]])

  vim.cmd([[syntax region TaggedLinkPattern matchgroup=Conceal start=/\[.\+\](/ end=/)/ concealends contains=@NoSpell]])
  vim.cmd([[highlight TaggedLinkPattern guifg=orange]])

  vim.cmd([[highlight Conceal ctermbg=none]])
  vim.cmd([[set conceallevel=2]])
  vim.cmd([[set concealcursor=nvic]])

  vim.cmd([[syntax region SemanticProsePattern matchgroup=Conceal start=/{/ end=/}/ concealends contains=@NoSpell]])
  vim.cmd([[highlight SemanticProsePattern guifg=orange]])

  vim.cmd([[syntax match FlashPattern "\#flash|"hs=e-6 conceal cchar=🌟]])
  vim.cmd([[highlight FlashPattern guifg=orange]])
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "VimEnter", "BufRead", "BufNewFile"}, {
  pattern = {
    "*/vault/*.dm",
    "*/vaults/*/*.dm"
  },
  callback = function()
    vim.cmd([[set tw=80]])
    vim.cmd([[set spell]])

    vim.keymap.set('n', '<return>', function()
      vim.cmd([[normal! wF["byi[]])
      vim.cmd([[execute ":edit " . @b . ".dm"]])
    end)

    vim.keymap.set('n', '<leader><return>', function()
      vim.cmd([[normal! wF["byi[]])
      vim.cmd([[execute ":!firefox " . @b]])
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

    vim.keymap.set('n', '<leader><leader>', function()
      vim.cmd([[execute ":silent !/home/sam/renumber/wrapper " . expand("%")]])
    end)

    vim.keymap.set('n', '<leader>s', function()
      vim.cmd([[lua HighlightSyntax()]])
    end)

    HighlightSyntax()

    vim.keymap.set('v', '<leader>m', function()
      -- copy ~/snippets/mermaid.html to /tmp/mermaid.html
      local filename = '/home/sam/snippets/mermaid.html'
      local file = io.open(filename, 'r')
      local contents = file:read('*a')
      file:close()

      vim.cmd([[normal! y]])
      local selection = vim.fn.getreg('0')

      contents = string.gsub(contents, "INSERT_HERE", selection)

      local filename = '/tmp/mermaid.html'
      local file = io.open(filename, 'w')
      file:write(contents)
      file:close()
      vim.cmd([[:!firefox --new-window /tmp/mermaid.html]])
    end)
  end,
})
