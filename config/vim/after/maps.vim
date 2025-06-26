let mapleader=" "

nnoremap <leader>pv <cmd>Ex<cr>
nnoremap <leader>pV <cmd>Vexplore<cr>
nnoremap <leader>pf :find<space>
nnoremap <leader>ps :grep<space>

function! ToggleQuickFix()
    if exists("g:qwindowopen")
        cclose
        unlet g:qwindowopen
    else
        copen
        let g:qwindowopen = 1
    endif
endfunction
nnoremap <leader>qq <cmd>call ToggleQuickFix()<cr>
nnoremap <leader>qc <cmd>cclose<cr>
nnoremap <leader>qn <cmd>cnext<cr>
nnoremap <leader>qp <cmd>cprev<cr>

" Running terminal tasks asynchronously
" in case dispatch.vim is inadequate or unavailable
cnoreabbrev term term ++shell

nnoremap <leader>hh :h <c-r><c-w><cr>

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

