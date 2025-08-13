let mapleader=" "

" Open VIMRC
nnoremap <leader>pC <cmd>e $MYVIMRC<cr>


" Netrw
nnoremap <leader>pv <cmd>Ex<cr>
nnoremap <leader>pV <cmd>Vexplore<cr>
nnoremap <leader>pf :find<space>
nnoremap <leader>ps :grep<space>

" Quickfix
function! ToggleQuickFix()
    cclose
    if exists("g:qwindowopen")
        cclose
        unlet g:qwindowopen
    else
        copen
        let g:qwindowopen = 1
    endif
endfunction
nnoremap <C-q> <cmd>call ToggleQuickFix()<cr>
nnoremap ]q <cmd>cnext<cr>
nnoremap [q <cmd>cprev<cr>

" Running terminal tasks asynchronously
" in case dispatch.vim is inadequate or unavailable
cnoreabbrev term term ++shell

" Search help page for word under cursor
nnoremap <leader>h :h <c-r><c-w><cr>

" Escape aliases
inoremap <C-c> <Esc>
inoremap jk <Esc>

" Center cursor after jumping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Wayland clipboard
vnoremap <silent> <leader>y :silent w !wl-copy<CR>

" Builtin commenting plugin
packadd comment
" yank text before commenting it out
nmap gyy yygcc
vmap gy ygvgc

