" Bootstrap for vim-plug
let data_dir = '~/.config/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'lervag/vimtex'

call plug#end()

runtime plugin/*
" runtime plugin/lsp.vim
" runtime plugin/undotree.vim
" runtime plugin/vimtex.vim
" runtime plugin/ultisnips.vim

