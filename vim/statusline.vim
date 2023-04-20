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
set statusline+=%#StatusMain#%{''}
set statusline+=\ 
set statusline+=%=
set statusline+=%#StatusMain#%{''}
set statusline+=%#StatusAccent#%{''}
set statusline+=\ %(Selection=%{WordCount()}\ Words=%{wordcount().words}\ Bytes=%{BytesInBuffer()}\ %l,%c%V\ %=\ %P%)
