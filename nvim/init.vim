set number
set relativenumber
set ignorecase
set smartcase
set mouse=a
set completeopt=noinsert,menuone,noselect,preview
"set termguicolors
set scrolloff=8
set clipboard+=unnamedplus
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

" Track the engine
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'mhinz/vim-startify'

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
" Coc config
" --------------------

runtime ./coc.vim

" -------------------
" vimtex
" -------------------

runtime ./vim-tex.vim

" -------------------
" ultisnips
" -------------------

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
