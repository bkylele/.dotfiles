let mapleader=" "

nnoremap <leader>pv :Ex<CR>
nnoremap <leader>pV <C-w>v<C-w>L:Ex<CR>
nnoremap <leader>pf :find *

" Running terminal tasks asynchronously
cnoreabbrev term vert bo term ++shell

" Escape aliases
inoremap <C-c> <Esc>
inoremap jk <Esc>

" Center cursor after jumping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Wayland clipboard
vnoremap <silent> <leader>y :silent w !wl-copy<CR>

packadd comment
" yank text before commenting it out
nmap gyy yygcc
vmap gy ygvgc
