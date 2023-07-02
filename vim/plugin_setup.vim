let g:ascii = [
      \ '        __',
      \ '.--.--.|__|.--------.',
      \ '|  |  ||  ||        |',
      \ ' \___/ |__||__|__|__|',
      \ ''
      \]
let g:startify_custom_header = g:ascii
"let g:startify_custom_header =
"        \ startify#pad(split(system('vim_header'), '\n'))

let g:startify_bookmarks = [
      \ '~/.config/nvim/init.vim',
      \ '~/.config/nvim/plugin/init.lua',
      \ '~/.config/fish/config.fish'
      \]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
