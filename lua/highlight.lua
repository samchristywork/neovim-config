-- Diff
vim.cmd("hi diffAdded ctermfg=green")
vim.cmd("hi diffRemoved ctermfg=red")

-- Search
vim.cmd("hi IncSearch cterm=reverse gui=reverse")
vim.cmd("hi Search cterm=underline ctermfg=0 ctermbg=11 gui=underline guifg=#f0a0c0 guibg=#302028")

-- Background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")

-- Status bar
vim.cmd("hi StatusAccent guifg=#222222 guibg=#888888 ctermfg=0 ctermbg=46")
vim.cmd("hi StatusMain guifg=#888888 guibg=NONE ctermbg=46 ctermfg=0")

-- Selection
vim.cmd("hi Visual cterm=underline ctermfg=186 ctermbg=64 gui=underline guifg=#5f8700 guibg=#071000")

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
