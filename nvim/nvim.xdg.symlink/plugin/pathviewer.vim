function! ShowMiniPath(timer)
    set statusline=-[%.30t]-%y-
endfunction

function! ShowFullPath()
    echo ''
    set statusline=-[%f]-%y-

    call timer_start(6000, 'ShowMiniPath')
endfunction

nnoremap <leader>f :call ShowFullPath()<cr>

