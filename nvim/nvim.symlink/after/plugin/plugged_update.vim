" Remind me to update my plugins every so often. Run a function at startup
" that checks when they were last updated.
let s:plug_update_file = '~/dotfiles/nvim/nvim.symlink/plugged-update'
" Update every two weeks
let s:plug_update_timeout = 60 * 60 * 24 * 14

function! NeedsUpdate(update_file)
    let now = system('date +%s')

    if !filereadable(a:update_file)
        return v:true
    endif

    let contents = readfile(a:update_file)
    if !exists('contents[0]')
        return v:true
    endif

    let updated_at = contents[0]
    let updated_threshold = now - s:plug_update_timeout

    if updated_at == '' || updated_at < updated_threshold
        return v:true
    endif

    return v:false
endfunc

function! UpdatePlugReminder()
    let file = expand(s:plug_update_file)
    let now = system('date +%s')
    if NeedsUpdate(file)
        let msg = "Your plugins haven't been updated for over two weeks."
        let msg .= "\n" . "Update plugins now? : "
        if input(msg, "Y") == "Y"
            PlugUpdate
            call writefile([now], file)
        endif
    endif
endfunc

