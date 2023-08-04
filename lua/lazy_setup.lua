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
  'dstein64/vim-startuptime',  -- :StartupTime
  'easymotion/vim-easymotion', -- Move around quickly
  'godlygeek/tabular',         -- Auto-align text
  'nvim-lua/plenary.nvim',     -- Useful functions, dependency for Telescope
  'terryma/vim-expand-region', -- + to expand visual selection and - to shrink it
  'tpope/vim-fugitive',        -- Git commands
  'tpope/vim-speeddating',     -- Use CTRL-A and CTRL-X to increment/decrement dates
  'tpope/vim-surround',        -- Add, delete, and change surroundings
  'wellle/visual-split.vim',   -- Resize split pane to match selection size

  -- Widgets/Menus
  'AckslD/messages.nvim',          -- Shows messages in floating buffer
  'ap/vim-css-color',              -- Preview CSS colors
  'junegunn/fzf.vim',              -- Fuzzy finding
  'mbbill/undotree',               -- Visual management of undo history
  'nvim-telescope/telescope.nvim', -- Opens search windows for files and strings
  'nvim-tree/nvim-tree.lua',       -- File browser
  'petertriho/nvim-scrollbar',     -- Adds a scrollbar on the right side of the main window
  'preservim/tagbar',              -- Browse tags ordered by scope
  'rcarriga/nvim-notify',          -- Notification manager
  'sidebar-nvim/sidebar.nvim',     -- Sidebar
  'sindrets/diffview.nvim',        -- Diff viewer
  'tc50cal/vim-terminal',          -- :TerminalSplit
  'ziontee113/color-picker.nvim',  -- Color picker

  -- Graphical
  'HiPhish/nvim-ts-rainbow2',            -- Rainbow parentheses
  'airblade/vim-gitgutter',              -- Display status of lines in the leftmost line
  'akinsho/bufferline.nvim',             -- Lists the open buffers in the status line
  'jbyuki/venn.nvim',                    -- Draw ASCII diagrams
  'kshenoy/vim-signature',               -- Show marks in the leftmost line
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides
  'nvim-tree/nvim-web-devicons',         -- Icons for nvim-tree

  -- LSP/Syntax/Autocomplete
  'L3MON4D3/LuaSnip',                        -- Snippets plugin
  'chrisgrieser/cmp-nerdfont',               -- Completion source for Nerd Fonts
  'davidsierradz/cmp-conventionalcommits',   -- Completion source for conventional commits
  'dmitmel/cmp-digraphs',                    -- Completion source for digraphs
  'hrsh7th/cmp-buffer',                      -- Use the current buffer as a completion source
  'hrsh7th/cmp-calc',                        -- Completion source for math
  'hrsh7th/cmp-emoji',                       -- Completion source for emoji
  'hrsh7th/cmp-nvim-lsp',                    -- LSP source for nvim-cmp
  'hrsh7th/cmp-path',                        -- Completion source for filesystem paths
  'hrsh7th/nvim-cmp',                        -- Autocompletion plugin
  'nvim-treesitter/nvim-treesitter',         -- Syntax highlighting
  'nvim-treesitter/nvim-treesitter-context', -- Show context at top of screen
  'rust-lang/rust.vim',                      -- Error checking and formatting for Rust (error highlighting)
  'saadparwaiz1/cmp_luasnip',                -- Snippets source for nvim-cmp
  'simrat39/rust-tools.nvim',                -- Rust tools like formatting, code actions, etc.
  'uga-rosa/cmp-dictionary',                 -- Completion source for dictionary

  -- Mason
  'mfussenegger/nvim-dap',             -- Debug support for Mason
  'neovim/nvim-lspconfig',             -- Required by Mason
  'williamboman/mason-lspconfig.nvim', -- Required by Mason
  'williamboman/mason.nvim',           -- Package manager for managing LSP servers, DAP servers, linters, and formatters

  -- Color schemes
  'catppuccin/nvim',                          -- Color scheme
  'embark-theme/vim',                         -- Color scheme
  'humanoid-colors/vim-humanoid-colorscheme', -- Color scheme
  'rebelot/kanagawa.nvim',                    -- Color scheme
  'yashguptaz/calvera-dark.nvim',             -- Color scheme
})
