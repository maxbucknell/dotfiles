function! StartUp()
endfunc

augroup startUp
    autocmd!

    autocmd VimEnter * call StartUp()
augroup END
