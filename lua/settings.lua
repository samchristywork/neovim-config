-- :set all to list all settings

-- Style
vim.opt.background="dark"
vim.opt.termguicolors=true
vim.opt.title=true

-- Editing
vim.o.clipboard = 'unnamedplus' -- Sync OS and vim clipboard
vim.opt.expandtab=true
vim.opt.joinspaces=false -- Don't adjoin two sentences with two space characters as is default.
vim.opt.shiftwidth=2
vim.opt.smarttab=true
vim.opt.softtabstop=0
vim.opt.tabstop=2

-- Usability
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.list=true
vim.opt.listchars="tab:<=>,trail:-"
vim.opt.mouse="a"
vim.opt.number=true
vim.opt.wrap=false

-- Search
vim.opt.ignorecase=true
vim.opt.smartcase=true

-- Misc
vim.opt.dictionary=vim.opt.dictionary+"/usr/share/dict/words" -- In insert mode, C-X, C-K will bring up the completion list if omnifunc is enabled
vim.opt.tags="./tags,tags,/home/sam/.commontags/tags"
