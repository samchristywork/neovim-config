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

set statusline=
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
set statusline+=%{bufferline#refresh_status()}
set statusline+=%#StatusAccent#%{''}
set statusline+=%{g:bufferline_status_info.before}
set statusline+=%#BufferlineSelected#%{''}
set statusline+=%{g:bufferline_status_info.current}
set statusline+=%#StatusAccent#%{''}
set statusline+=%{g:bufferline_status_info.after}
set statusline+=%#StatusMain#%{''}
set statusline+=\ 
set statusline+=%{nvim_treesitter#statusline(90)}\ 
set statusline+=%=
set statusline+=%#StatusMain#%{''}
set statusline+=%#StatusAccent#%{''}
set statusline+=\ %(Selection=%{WordCount()}\ Words=%{wordcount().words}\ Bytes=%{BytesInBuffer()}\ %l,%c%V\ %=\ %P%)
