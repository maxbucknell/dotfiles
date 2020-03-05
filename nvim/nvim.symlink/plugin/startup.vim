function! StartUp()
    call darkmodesocket#listenForLights()
    call UpdatePlugReminder()
endfunc

augroup startUp
    autocmd!

    autocmd VimEnter * call StartUp()
augroup END
