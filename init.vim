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
lua require('core/lazy_setup')

colorscheme humanoid

lua require('core/git')
lua require('core/keybindings')
lua require('core/movement')
lua require('core/settings')
lua require('mappings')
lua require('plugin_setup')
lua require('rust')
lua require('sidebars')
lua require('snippets')
lua require('telescope')

" Must be after settings
lua require('core/highlight')

function! BytesInBuffer()
  return line2byte(line('$') + 1)
endfunction

function! WordCount()
  let a='N/A'
  if has_key(wordcount(), 'visual_words')
    let a=wordcount().visual_words
  endif
  return a
endfunction

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
  nnoremap <leader>v :set cursorline! cursorcolumn!<CR>

  " Highlight current line and set mark l so that you can go back to it with 'l
  nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
augroup END

set statusline=
set statusline+=%#StatusMain#%{''}
set statusline+=\ 
set statusline+=%=
set statusline+=%#StatusMain#%{''}
set statusline+=%#StatusAccent#%{''}
set statusline+=%(Selection=%{WordCount()}\ Words=%{wordcount().words}\ Bytes=%{BytesInBuffer()}\ %l,%c%V\ %=\ %P%)
