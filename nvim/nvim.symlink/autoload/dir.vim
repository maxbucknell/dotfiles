function dir#ensureExists()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        try
            call mkdir(required_dir, 'p')
        catch
            echom "Could not create directory"
            exit
        endtry
    endif
endfunction
