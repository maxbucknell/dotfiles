augroup AutoMkdir
    autocmd!

    autocmd BufNewFile * :call dir#ensureExists()
augroup END

