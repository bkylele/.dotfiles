" set block cursor
set guicursor=""

" set relative and absolute line numbers
set nu rnu

" cursor is minimum of 8 lines from the edges of the screen
set scrolloff=8
set sidescrolloff=8

" set tab width
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" auto indent new lines
set smartindent

" persistent undo history
set noswapfile
set nobackup
set undodir=$HOME/.cache/vim/undo/
set undofile

set viminfofile=$HOME/.cache/vim/viminfo

let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" show search matches as you type
set incsearch
set nohlsearch

" case insensitive search unless uppercase is used
set ignorecase
set smartcase

let loaded_matchparen = 0

" For use with :find
set path+=**

" Misc appearance

" sometimes setting these will fix colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
set termguicolors
set conceallevel=2

" colorscheme pink-moon
" colorscheme molokai
colorscheme catppuccin_macchiato
" colorscheme gruvbox

set nocompatible
filetype plugin indent on
syntax on
