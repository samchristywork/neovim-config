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
lua require('core/lazy_setup')

colorscheme humanoid

lua << EOF
require('autocommands') -- Do not track
require('vault') -- Do not track
require('core/git')
require('core/keybindings')
require('core/movement')
require('core/settings')
require('custom_commands')
require('mappings')
require('diagnostics')
require('plugin_setup')
require('rust')
--lua require('sidebars')
require('snippets')
require('telescope')

--Must be after settings
require('core/highlight')
EOF

vnoremap m :'<,'>!xclip -i; xclip -o;/home/sam/tts/tts_command<CR>
