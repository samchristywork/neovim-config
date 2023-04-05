-- Diff
vim.cmd("hi diffAdded ctermfg=green")
vim.cmd("hi diffRemoved ctermfg=red")

-- Search
vim.cmd("hi IncSearch cterm=reverse gui=reverse")
vim.cmd("hi Search cterm=underline ctermfg=0 ctermbg=11 gui=underline guifg=#f0a0c0 guibg=#302028")

-- Background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

-- Status bar
vim.cmd("hi BufferlineSelected guifg=#440000 guibg=#888888 ctermfg=0 ctermbg=46 gui=underline")
vim.cmd("hi StatusAccent guifg=#222222 guibg=#888888 ctermfg=0 ctermbg=46")
vim.cmd("hi StatusMain guifg=#888888 guibg=#222222 ctermbg=46 ctermfg=0")

-- Selection
vim.cmd("hi Visual cterm=underline ctermfg=186 ctermbg=64 gui=underline guifg=#5f8700 guibg=#071000")
