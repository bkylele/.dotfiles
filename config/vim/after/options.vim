" set block cursor
set guicursor=""

" set hybrid relative and absolute line numbers
set number
set relativenumber

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

" move to new split when creating one
set splitbelow
set splitright

" persistent undo history
set noswapfile
set nobackup
set undodir=$HOME/.cache/vim/undo/
set undofile
if !isdirectory(&undodir)
    call mkdir(&undodir, "p", 0700)
endif

set viminfofile=$HOME/.cache/vim/viminfo

" better netrw
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" better search
set incsearch
set hlsearch
set ignorecase
set smartcase

" For use with :find
set path+=**

" Misc appearance
set background=dark
set termguicolors
set conceallevel=2

" sometimes setting these will fix colors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme catppuccin_macchiato

set nocompatible
filetype plugin indent on
syntax on
