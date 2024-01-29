local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- General/Misc
  'github/copilot.vim',                          -- Copilot
  'godlygeek/tabular',                           -- Auto-align text
  'nvim-lua/plenary.nvim',                       -- Useful functions, dependency for Telescope
  'nvim-treesitter/nvim-treesitter-textobjects', -- Text objects for treesitter (e.g. function, class, etc.)

  -- Widgets/Menus
  'junegunn/fzf.vim',              -- Fuzzy finding
  'nvim-telescope/telescope.nvim', -- Opens search windows for files and strings
  'nvim-tree/nvim-tree.lua',       -- File browser
  'petertriho/nvim-scrollbar',     -- Adds a scrollbar on the right side of the main window

  -- Graphical
  'airblade/vim-gitgutter',      -- Display status of lines in the leftmost line
  'akinsho/bufferline.nvim',     -- Lists the open buffers in the status line
  'jbyuki/venn.nvim',            -- Draw ASCII diagrams
  'nvim-tree/nvim-web-devicons', -- Icons for nvim-tree

  -- LSP/Syntax/Autocomplete
  'L3MON4D3/LuaSnip',                        -- Snippets plugin
  'hrsh7th/cmp-buffer',                      -- Use the current buffer as a completion source
  'hrsh7th/cmp-calc',                        -- Completion source for math
  'hrsh7th/cmp-nvim-lsp',                    -- LSP source for nvim-cmp
  'hrsh7th/nvim-cmp',                        -- Autocompletion plugin
  'nvim-treesitter/nvim-treesitter',         -- Syntax highlighting
  'nvim-treesitter/nvim-treesitter-context', -- Show context at top of screen
  'rust-lang/rust.vim',                      -- Error checking and formatting for Rust (error highlighting)
  'saadparwaiz1/cmp_luasnip',                -- Snippets source for nvim-cmp
  'simrat39/rust-tools.nvim',                -- Rust tools like formatting, code actions, etc.

  -- Mason
  'neovim/nvim-lspconfig',             -- Required by Mason
  'williamboman/mason-lspconfig.nvim', -- Required by Mason
  'williamboman/mason.nvim',           -- Package manager for managing LSP servers, DAP servers, linters, and formatters

  -- Color schemes
  'humanoid-colors/vim-humanoid-colorscheme', -- Color scheme
})

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    enable = true,
  },
}
