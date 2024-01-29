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

" ## Plugins
" Remember to :checkhealth every once in a while
lua require('lazy_setup')

colorscheme humanoid

lua << EOF
require('custom_commands')
require('diagnostics')
require('git')
require('go')
require('keybindings')
require('mappings')
require('movement')
require('plugin_setup')
require('rust')
require('settings')
require('snippets')
require('telescope')

--Must be after settings
require('highlight')
EOF

vnoremap m :'<,'>!xclip -i; xclip -o;/home/sam/tts/tts_command<CR>
