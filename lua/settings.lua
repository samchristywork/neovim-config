-- :set all to list all settings

-- Style
vim.opt.background = "dark"  -- "dark" or "light"
vim.opt.termguicolors = true -- Enable 24-bit RGB color
vim.opt.title = true         -- Set window title to filename

-- Editing
vim.o.clipboard = 'unnamedplus' -- Sync OS and vim clipboard
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.joinspaces = false      -- Don't adjoin two sentences with two space characters as is default.
vim.opt.smarttab = true         -- Insert spaces when tab is pressed

vim.opt.shiftwidth = 2  -- Number of spaces to use for each step of autoindent
vim.opt.softtabstop = 0 -- Make it "feel" like tabs are being inserted
vim.opt.tabstop = 2     -- Number of spaces that a <Tab> counts for

-- Usability
vim.opt.hlsearch = true               -- Highlight search results
vim.opt.incsearch = true              -- Show search results as you type
vim.opt.list = true                   -- Show whitespace characters
vim.opt.listchars = "tab:<=>,trail:-" -- Show tabs as "<=>", and trailing whitespace as "-"
vim.opt.mouse = "a"                   -- Enable mouse support
vim.opt.number = true                 -- Show line numbers
vim.opt.wrap = false                  -- Don't wrap lines

-- Search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Don't ignore case if search term contains uppercase characters

-- Misc
vim.opt.dictionary = vim.opt.dictionary+"/usr/share/dict/words" -- In insert mode, C-X, C-K will bring up the completion list if omnifunc is enabled
vim.opt.tags = "./tags,tags,/home/sam/.commontags/tags"         -- Tags file locations
vim.opt.completeopt = "menu,menuone,noselect"                   -- menuone is default, menu is for showing the menu even if there is only one match, noselect is for not selecting the first match
vim.opt.scrolloff = 5                                           -- Number of lines to keep above and below cursor
vim.opt.autoread = true                                         -- Reload file if it changes on disk
vim.g.tagbar_show_tag_linenumbers = 2                           -- Show line numbers in tagbar
vim.g.tagbar_sort = 0                                           -- Sort tagbar by tag name
vim.g.html_number_lines = 0                                     -- Disable line numbers in :TOhtml output
vim.g.html_use_css = 0                                          -- Use inline css instead of style tag for :TOhtml
