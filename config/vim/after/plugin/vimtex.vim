" VimTex
let g:vimtex_compiler_latexmk = {
            \ 'executable': 'latexmk',
            \ 'options': [
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-file-line-error',
            \ ],
            \ 'out_dir': 'build',
            \ 'aux_dir': 'aux',
            \ }

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options = '-reuse-instance -forward-search -inverse-search @tex @line @pdf'

" Turn on spell checker
autocmd FileType tex setlocal spell
