" Compiler options
let g:vimtex_compiler_latexmk = {
            \ 'aux_dir' : 'aux',
            \ 'out_dir' : 'build',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

" viewer options
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options = '-reuse-instance -forward-search -inverse-search @tex @line @pdf'

let g:vimtex_fold_enabled = 1
