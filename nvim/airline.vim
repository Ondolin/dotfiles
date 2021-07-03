" ------------------------
" Airline configuration
" ------------------------

let g:airline_powerline_fonts = 1

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#denite#enabled = 1
let g:airline#extensions#fzf#enabled = 1

let g:airline_theme='everforest'

let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 100,
      \ 'x': 100,
      \ 'y': 100,
      \ 'z': 100,
      \ 'warning': 150,
      \ 'error': 200,
      \ }
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      "\ [ 'x', 'y', 'z', 'error', 'warning' ]
      \ [ 'x', 'y', 'z']
      \ ]
