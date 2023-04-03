filetype plugin indent on
set nocompatible
set termguicolors
syntax enable

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ## Misc
:cnoreabbrev h vert h

" ## Plugins
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" Remember to :checkhealth every once in a while

Plugin 'VundleVim/Vundle.vim'             " Package manager
Plugin 'godlygeek/tabular'                " Auto-align text
Plugin 'mfussenegger/nvim-dap'            " Debug support for Mason
Plugin 'mhinz/vim-startify'               " Start screen
Plugin 'raghur/vim-ghost'                 " Type in the browser
Plugin 'terryma/vim-expand-region'        " + to expand visual selection and - to shrink it
Plugin 'tpope/vim-fugitive.git'           " Git commands

" Widgets/Graphical
Plugin 'AckslD/messages.nvim'          " Shows messages in floating buffer
Plugin 'airblade/vim-gitgutter.git'    " Display status of lines in the leftmost line
Plugin 'ap/vim-css-color'              " Preview CSS colors
Plugin 'bling/vim-bufferline'          " Lists the open buffers in the status line
Plugin 'jbyuki/venn.nvim'              " Draw ASCII diagrams
Plugin 'junegunn/fzf.vim'              " Fuzzy finding
Plugin 'lcheylus/overlength.nvim'      " Highlights lines that are too long
Plugin 'mbbill/undotree'               " Visual management of undo history
Plugin 'nvim-lua/plenary.nvim'         " Useful functions, dependency for Telescope
Plugin 'nvim-telescope/telescope.nvim' " Opens search windows for files and strings
Plugin 'petertriho/nvim-scrollbar'     " Adds a scrollbar on the right side of the main window
Plugin 'preservim/nerdtree'            " File browser
Plugin 'preservim/tagbar'              " Browse tags ordered by scope
Plugin 'rcarriga/nvim-notify'          " Notification manager
Plugin 'sidebar-nvim/sidebar.nvim'     " Sidebar
Plugin 'tc50cal/vim-terminal'          " :TerminalSplit

" LSP/Syntax
Plugin 'nvim-treesitter/nvim-treesitter'         " Syntax highlighting
Plugin 'nvim-treesitter/nvim-treesitter-context' " Show context at top of screen

Plugin 'L3MON4D3/LuaSnip'         " Snippets plugin
Plugin 'hrsh7th/cmp-nvim-lsp'     " LSP source for nvim-cmp
Plugin 'hrsh7th/nvim-cmp'         " Autocompletion plugin
Plugin 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp

" Mason
Plugin 'neovim/nvim-lspconfig'             " Required by Mason
Plugin 'williamboman/mason-lspconfig.nvim' " Required by Mason
Plugin 'williamboman/mason.nvim'           " Package manager for managing LSP servers, DAP servers, linters, and formatters

" Color schemes
Plugin 'embark-theme/vim'             " Color scheme
Plugin 'rebelot/kanagawa.nvim'        " Color scheme
Plugin 'yashguptaz/calvera-dark.nvim' " Color scheme

call vundle#end()
