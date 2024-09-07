augroup WindowManagement
    autocmd!

    autocmd WinEnter * setl rnu cul syntax=on
    autocmd WinLeave * setl nornu nocul syntax=off
augroup END
