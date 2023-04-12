vim.keymap.set('v', '<leader>s', function()
  vim.cmd(':norm "zy')
  vim.cmd(':let g:snippetfilename=input("Enter filename for snippet: ")')
  local filename=vim.g.snippetfilename
  vim.cmd(':call writefile(getreg("z", 1, 1), "/home/sam/snippets/'..filename..'", "a")')
end)

vim.keymap.set('n', '<leader>r', function()
  -- You could also replace "ls" with "grep -riP .", but the sink would also have to change to extract the filename
  vim.cmd(":call fzf#run({'dir': '~/snippets', 'source': 'ls', 'sink': 'read', 'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color always {}'], 'window': {'width': 0.9, 'height': 0.6}})")
end)
