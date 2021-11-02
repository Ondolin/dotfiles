set number
set relativenumber
set ignorecase
set smartcase
set mouse=a
set completeopt=noinsert,menuone,noselect,preview
"set termguicolors
set scrolloff=8
"set clipboard+=unnamedplus
set signcolumn=yes
set ruler

set path=.,,**

set undofile
set undodir=~/.vim/undo

filetype on
filetype plugin indent on

let mapleader=" "

call plug#begin('~/.local/share/nvim/plugged')

" themes
Plug 'sainnhe/forest-night'
Plug 'sainnhe/everforest'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" header and footer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" latex
Plug 'lervag/vimtex'

" Snippets repo (managed local by coc-snippets)
Plug 'honza/vim-snippets'

" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Start sccreen
Plug 'mhinz/vim-startify'

" Git functions
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" Plug 'github/copilot.vim'

" File diffs
" Plug 'sjl/gundo.vim'
Plug 'simnalamburt/vim-mundo'

" enable repeat with . for plugin commands
Plug 'tpope/vim-repeat'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'liuchengxu/vista.vim'

" Grammar checking
Plug 'dpelle/vim-LanguageTool' 

call plug#end()

" --------------------
"  Themes
" --------------------

colorscheme everforest

runtime ./airline.vim

" --------------------
" Indentation
" --------------------

set autoindent
set tabstop=4    " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab    " On pressing tab, insert 4 spaces

" --------------------
" Spell checking
" --------------------

runtime ./spell.vim

" --------------------
" Coding stuff
" --------------------

runtime ./coc.vim

let g:vista_default_executive = 'coc'

let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

nnoremap <leader>o :Vista!! <CR>

" -------------------
" vimtex
" -------------------

runtime ./vim-tex.vim

" -------------------
"  FZF
" -------------------

let loaded_netrwPlugin = 1

nnoremap <leader>b :Buffers <CR>
nnoremap <leader>f :Files <CR>

" -------------------
" Git stuff
" -------------------

" Get into insert mode when starting to commit
autocmd User VimagitEnterCommit startinsert
nnoremap <leader>g :Magit <CR>

" -------------------
" Usefull functions
" -------------------

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Mundo condif
nnoremap <leader>d :MundoToggle <CR>

" -------------------
" Auto close buffer
" -------------------

" Thanks to romainl from https://stackoverflow.com/questions/69787994/close-vim-if-no-unhidden-buffers-open/69805143#69805143
augroup auto_close_win
  autocmd!
  autocmd BufEnter * call s:quit_current_win()
augroup END

function! s:quit_current_win() abort
  let quit_filetypes = ['magit', 'vista', 'MundoDiff']
  let buftype = getbufvar(bufnr(), '&filetype')
  if winnr('$') == 1 && index(quit_filetypes, buftype) != -1
    quit
  endif
endfunction
