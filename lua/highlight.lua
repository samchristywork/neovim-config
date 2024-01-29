-- Diff
vim.cmd("hi diffAdded ctermfg=green")
vim.cmd("hi diffRemoved ctermfg=red")

-- Background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")

-- Key command to interpret ASCII checkboxes
vim.keymap.set("n", "<leader>h", function()
  vim.cmd([[set conceallevel=1]])
  vim.cmd([[syntax match todoCheckbox "\[\ \]"hs=e-4 conceal cchar=]])
  vim.cmd([[syntax match todoCheckbox "\[o\]"hs=e-4 conceal cchar=]])
  vim.cmd([[syntax match todoCheckbox "\[x\]"hs=e-4 conceal cchar=☒]])
  vim.cmd([[syntax match todoCheckbox "\[\.\]"hs=e-4 conceal cchar=⊡]])
  vim.cmd([[syntax match todoCheckbox "\[/\]"hs=e-4 conceal cchar=⬕]])
  vim.cmd([[highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE]])
end, { noremap = true, silent = true })
