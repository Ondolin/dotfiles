"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
"let g:vimtex_enabled = 0
"let g:vimtex_compiler_progname = 'nvr'
"let g:vimtex_complete_enabled = 1
"let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 0
" let g:vimtex_view_general_viewer = 'evince'
let g:tex_flavor = 'latex'

autocmd FileType tex :NoMatchParen
"
au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
    \ let g:loaded_matchparen=1 |

nnoremap <localleader>lt :call vimtex#fzf#run()<cr>

