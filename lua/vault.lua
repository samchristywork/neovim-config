local currentNamespace = vim.api.nvim_create_namespace("lint")
local currentBuf = vim.api.nvim_get_current_buf()

function HighlightSyntax()
  vim.cmd([[set syntax=]])
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

  vim.cmd([[syntax region AngleBracketsContents matchgroup=Conceal start=/</ end=/>/ concealends contains=@NoSpell]])
  vim.cmd([[highlight AngleBracketsContents guifg=blue]])

  vim.cmd([[highlight Conceal ctermbg=none]])
  vim.cmd([[set conceallevel=2]])
  vim.cmd([[set concealcursor=]])


  vim.cmd([[syntax match FlashPattern "\#flash|"hs=e-6 conceal cchar=🌟]])
  vim.cmd([[highlight FlashPattern guifg=orange]])

  vim.cmd([[syntax region CodeContents start=/```/ end=/```/ contains=@NoSpell]])
  vim.cmd([[highlight CodeContents guifg=limegreen]])

  vim.cmd([[syntax region FrontMatterContents start=/--/ end=/--/ contains=@NoSpell]])
  vim.cmd([[highlight FrontMatterContents guifg=limegreen]])

  local colors = {
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "purple",
    "magenta",
    "cyan",
    "white",
    "black",
  }

  for i, color in ipairs(colors) do
    vim.cmd([[syntax region ]] ..
      color .. [[Pattern matchgroup=Conceal start=/{]] .. color .. [[ / end=/}/ concealends contains=@NoSpell]])
    vim.cmd([[highlight ]] .. color .. [[Pattern guifg=]] .. color)
  end
end

local function openLink()
  local line = vim.fn.getline('.')

  local localLink = string.match(line, '%[(.*)%]')
  local firefoxLink = string.match(line, '<(.*)>')

  if (firefoxLink) then
    vim.cmd([[execute ":!firefox " . "']] .. firefoxLink .. [['"]])
    return
  end

  if (localLink) then
    local linkName = localLink .. '.dm'
    vim.cmd([[execute ":edit " . "]] .. linkName .. [["]])
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "VimEnter", "BufRead", "BufNewFile" }, {
  pattern = {
    "*/vault/*.dm",
    "*/vaults/*/*.dm"
  },
  callback = function()
    vim.cmd([[set tw=80]])
    vim.cmd([[set spell]])

    vim.keymap.set('n', '<return>', function()
      openLink()
    end)

    vim.keymap.set('n', '<leader><return>', function()
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

              vim.api.nvim_put({ filename.value }, 'l', true, true)
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

function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

vim.api.nvim_create_autocmd(
  { "TextChanged", "TextChangedI", "BufEnter", "BufWinEnter", "VimEnter", "BufRead", "BufNewFile" }, {
    pattern = {
      "*/vault/*.dm",
    },
    callback = function()
      vim.diagnostic.reset(currentNamespace, currentBuf)

      local diagnostics = {}

      if (not string.match(vim.fn.getline(1), '#')) then
        table.insert(diagnostics,
          {
            bufnr = currentBuf,
            lnum = 0,
            end_lnum = 0,
            col = 1,
            end_col = 1,
            severity = vim.diagnostic.severity.ERROR,
            message = 'Missing title',
            source = 'test'
          })
      end

      if (not string.match(vim.fn.getline(2), '%-%-')) then
        table.insert(diagnostics,
          {
            bufnr = currentBuf,
            lnum = 1,
            end_lnum = 1,
            col = 1,
            end_col = 1,
            severity = vim.diagnostic.severity.ERROR,
            message = 'Missing frontmatter',
            source = 'test'
          })
      end

      for lnum = 1, vim.fn.line('$') do
        local line = vim.fn.getline(lnum)
        local localLink = string.match(line, '%[(.*)%]')
        if localLink then
          if not file_exists(localLink .. ".dm") then
            table.insert(diagnostics,
              {
                bufnr = currentBuf,
                lnum = lnum - 1,
                end_lnum = lnum - 1,
                col = 1,
                end_col = 1,
                severity = vim.diagnostic.severity.INFO,
                message = "Link does not exist.",
                source = 'test'
              })
          end
        end
      end
      vim.diagnostic.set(currentNamespace, currentBuf, diagnostics)
    end,
  })
