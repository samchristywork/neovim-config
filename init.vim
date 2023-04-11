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

" Remember to :checkhealth every once in a while
call vundle#begin()
runtime vim/load_plugins.vim
call vundle#end()

colorscheme slate

runtime vim/scratch.vim
runtime vim/statusline.vim
runtime vim/plugin_setup.vim

lua require('autocommands')
lua require('autorun')
lua require('git')
lua require('keybindings')
lua require('mappings')
lua require('movement')
lua require('plugin_setup')
lua require('scratch')
lua require('settings')
lua require('sidebars')
lua require('telescope')

lua require('init')

" Must be after settings
lua require('highlight')
