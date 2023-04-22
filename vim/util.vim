function! WipeRegisters ()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunction

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
  nnoremap <leader>v :set cursorline! cursorcolumn!<CR>

  " Highlight current line and set mark l so that you can go back to it with 'l
  nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
augroup END

function! Scratch()
  split
  file scratch
  noswapfile hide enew
  setlocal bufhidden=hide
  setlocal buftype=nofile
  setlocal laststatus=0
  setlocal laststatus=0
  setlocal nobuflisted
  setlocal nonu
  setlocal noruler
  setlocal noshowcmd
  setlocal noshowmode
endfunction
