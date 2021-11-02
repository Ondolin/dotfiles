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

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


" -------------------
" vimtex
" -------------------

runtime ./vim-tex.vim

" -------------------
"  FZF
" -------------------

" Use fzf when opening a directory
autocmd VimEnter * if isdirectory(expand("<amatch>")) | exe 'Files! '.expand("<amatch>") | endif
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | Files | wincmd w | endif

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
set undofile
set undodir=~/.vim/undo
nnoremap <leader>d :MundoToggle <CR>
