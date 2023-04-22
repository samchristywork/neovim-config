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
" Remember to :checkhealth every once in a while
call plug#begin()
runtime vim/load_plugins.vim
call plug#end()

colorscheme catppuccin

runtime vim/plugin_setup.vim
runtime vim/statusline.vim
runtime vim/util.vim

lua require('git')
lua require('keybindings')
lua require('mappings')
lua require('movement')
lua require('plugin_setup')
lua require('rust')
lua require('settings')
lua require('sidebars')
lua require('snippets')
lua require('telescope')

" Must be after settings
lua require('highlight')
