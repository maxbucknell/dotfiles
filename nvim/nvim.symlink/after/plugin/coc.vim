if ! exists(':CocInfo')
    finish
endif

augroup Coc
    autocmd!

    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
