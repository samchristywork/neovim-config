" General/Misc
Plug 'dstein64/vim-startuptime'  " :StartupTime
Plug 'easymotion/vim-easymotion' " Move around quickly
Plug 'godlygeek/tabular'         " Auto-align text
Plug 'nvim-lua/plenary.nvim'     " Useful functions, dependency for Telescope
Plug 'raghur/vim-ghost'          " Type in the browser
Plug 'terryma/vim-expand-region' " + to expand visual selection and - to shrink it
Plug 'tpope/vim-fugitive'        " Git commands
Plug 'tpope/vim-speeddating'     " Use CTRL-A and CTRL-X to increment/decrement dates
Plug 'tpope/vim-surround'        " Add, delete, and change surroundings
Plug 'wellle/visual-split.vim'   " Resize split pane to match selection size

" Widgets/Menus
Plug 'AckslD/messages.nvim'          " Shows messages in floating buffer
Plug 'ap/vim-css-color'              " Preview CSS colors
Plug 'junegunn/fzf.vim'              " Fuzzy finding
Plug 'mbbill/undotree'               " Visual management of undo history
Plug 'mhinz/vim-startify'            " Start screen
Plug 'nvim-telescope/telescope.nvim' " Opens search windows for files and strings
Plug 'nvim-tree/nvim-tree.lua'       " File browser
Plug 'petertriho/nvim-scrollbar'     " Adds a scrollbar on the right side of the main window
Plug 'preservim/tagbar'              " Browse tags ordered by scope
Plug 'rcarriga/nvim-notify'          " Notification manager
Plug 'sidebar-nvim/sidebar.nvim'     " Sidebar
Plug 'sindrets/diffview.nvim'        " Diff viewer
Plug 'tc50cal/vim-terminal'          " :TerminalSplit
Plug 'ziontee113/color-picker.nvim'  " Color picker

" Graphical
Plug 'HiPhish/nvim-ts-rainbow2'            " Rainbow parentheses
Plug 'airblade/vim-gitgutter'              " Display status of lines in the leftmost line
Plug 'akinsho/bufferline.nvim'             " Lists the open buffers in the status line
Plug 'jbyuki/venn.nvim'                    " Draw ASCII diagrams
Plug 'kshenoy/vim-signature'               " Show marks in the leftmost line
Plug 'lukas-reineke/indent-blankline.nvim' " Add indentation guides
Plug 'nvim-tree/nvim-web-devicons'         " Icons for nvim-tree

" LSP/Syntax/Autocomplete
Plug 'L3MON4D3/LuaSnip'                        " Snippets plugin
Plug 'chrisgrieser/cmp-nerdfont'               " Completion source for Nerd Fonts
Plug 'davidsierradz/cmp-conventionalcommits'   " Completion source for conventional commits
Plug 'dmitmel/cmp-digraphs'                    " Completion source for digraphs
Plug 'hrsh7th/cmp-buffer'                      " Use the current buffer as a completion source
Plug 'hrsh7th/cmp-calc'                        " Completion source for math
Plug 'hrsh7th/cmp-emoji'                       " Completion source for emoji
Plug 'hrsh7th/cmp-nvim-lsp'                    " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-path'                        " Completion source for filesystem paths
Plug 'hrsh7th/nvim-cmp'                        " Autocompletion plugin
Plug 'nvim-treesitter/nvim-treesitter'         " Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter-context' " Show context at top of screen
Plug 'rust-lang/rust.vim'                      " Error checking and formatting for Rust (error highlighting)
Plug 'saadparwaiz1/cmp_luasnip'                " Snippets source for nvim-cmp
Plug 'simrat39/rust-tools.nvim'                " Rust tools like formatting, code actions, etc.
Plug 'uga-rosa/cmp-dictionary'                 " Completion source for dictionary

" Mason
Plug 'mfussenegger/nvim-dap'             " Debug support for Mason
Plug 'neovim/nvim-lspconfig'             " Required by Mason
Plug 'williamboman/mason-lspconfig.nvim' " Required by Mason
Plug 'williamboman/mason.nvim'           " Package manager for managing LSP servers, DAP servers, linters, and formatters

" Color schemes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Color scheme
Plug 'embark-theme/vim'                        " Color scheme
Plug 'rebelot/kanagawa.nvim'                   " Color scheme
Plug 'yashguptaz/calvera-dark.nvim'            " Color scheme
