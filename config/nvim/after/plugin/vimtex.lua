vim.g.vimtex_compiler_latexmk = {
    executable = 'latexmk',
    options = {
        '-synctex=1',
        '-interaction=nonstopmode',
        '-file-line-error',
    },
    out_dir = 'build',
}

vim.g.vimtex_view_method= 'zathura'
-- vim.g.vimtex_view_general_options = '-reuse-instance -forward-search -inverse-search @tex @line @pdf'

