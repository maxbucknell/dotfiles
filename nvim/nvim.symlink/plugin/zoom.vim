" Zoom the current split
"
" Tmux has a feature <prefix>-z, that will zoom the current pane. I decided
" that this was a useful enough feature to have in Vim as well. Voila.
function s:ZoomOrUnzoom()
    if exists('s:is_zoomed')
        unlet s:is_zoomed
        execute "wincmd ="
    else
        let s:is_zoomed = 'true'
        execute "wincmd _"
        execute "wincmd \|"
    endif
endfunc

nnoremap <Plug>ZoomOrUnzoom
            \ :<c-u>call <SID>ZoomOrUnzoom()<cr>
