" Bootstrap for vim-plug
let data_dir = '~/.config/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

" Extensions to vim built-ins
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'

" Extensions to project workflows
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/vim-lsp'

" Miscellaneous/Specialized
Plug 'lervag/vimtex'

call plug#end()

runtime plugin/*
