" Use these programs for internal vim commands if they are avaialable

" if executable('fd')
"     function! FdFind(cmdargs, cmdcomplete)
"         let fnames = systemlist('fd ' . a:cmdargs)
"         return l:fnames
"     endfunction
"     set findfunc=FdFind
" endif

if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case
else  
    set grepprg=grep\ -n\ -r\ $*\ /dev/null
endif
