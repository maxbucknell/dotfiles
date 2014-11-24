if exists("g:loaded_syntastic_notifier_signs") || !exists("g:loaded_syntastic_plugin")
    finish
endif
let g:loaded_syntastic_notifier_signs = 1

" Initialisation {{{1

" start counting sign ids at 5000, start here to hopefully avoid conflicting
" with any other code that places signs (not sure if this precaution is
" actually needed)
let s:first_sign_id = 5000
let s:next_sign_id = s:first_sign_id

let g:SyntasticSignsNotifier = {}

let s:setup_done = 0

" }}}1

" Public methods {{{1

function! g:SyntasticSignsNotifier.New() " {{{2
    let newObj = copy(self)

    if !s:setup_done
        call self._setup()
        let s:setup_done = 1
        lockvar s:setup_done
    endif

    return newObj
endfunction " }}}2

function! g:SyntasticSignsNotifier.enabled() " {{{2
    return has('signs') && syntastic#util#var('enable_signs')
endfunction " }}}2

function! g:SyntasticSignsNotifier.refresh(loclist) " {{{2
    call syntastic#log#debug(g:_SYNTASTIC_DEBUG_NOTIFICATIONS, 'signs: refresh')
    let old_signs = copy(self._bufSignIds())
    if self.enabled()
        call self._signErrors(a:loclist)
    endif
    call self._removeSigns(old_signs)
endfunction " }}}2

" }}}1

" Private methods {{{1

" One time setup: define our own sign types and highlighting
function! g:SyntasticSignsNotifier._setup() " {{{2
    if has('signs')
        if !hlexists('SyntasticErrorSign')
            highlight link SyntasticErrorSign error
        endif
        if !hlexists('SyntasticWarningSign')
            highlight link SyntasticWarningSign todo
        endif
        if !hlexists('SyntasticStyleErrorSign')
            highlight link SyntasticStyleErrorSign SyntasticErrorSign
        endif
        if !hlexists('SyntasticStyleWarningSign')
            highlight link SyntasticStyleWarningSign SyntasticWarningSign
        endif
        if !hlexists('SyntasticStyleErrorLine')
            highlight link SyntasticStyleErrorLine SyntasticErrorLine
        endif
        if !hlexists('SyntasticStyleWarningLine')
            highlight link SyntasticStyleWarningLine SyntasticWarningLine
        endif

        " define the signs used to display syntax and style errors/warns
        exe 'sign define SyntasticError text=' . g:syntastic_error_symbol .
            \ ' texthl=SyntasticErrorSign linehl=SyntasticErrorLine'
        exe 'sign define SyntasticWarning text=' . g:syntastic_warning_symbol .
            \ ' texthl=SyntasticWarningSign linehl=SyntasticWarningLine'
        exe 'sign define SyntasticStyleError text=' . g:syntastic_style_error_symbol .
            \ ' texthl=SyntasticStyleErrorSign linehl=SyntasticStyleErrorLine'
        exe 'sign define SyntasticStyleWarning text=' . g:syntastic_style_warning_symbol .
            \ ' texthl=SyntasticStyleWarningSign linehl=SyntasticStyleWarningLine'
    endif
endfunction " }}}2

" Place signs by all syntax errors in the buffer
function! g:SyntasticSignsNotifier._signErrors(loclist) " {{{2
    let loclist = a:loclist
    if !loclist.isEmpty()

        let buf = bufnr('')
        if !bufloaded(buf)
            " signs can be placed only in loaded buffers
            return
        endif

        " errors come first, so that they are not masked by warnings
        let issues = copy(loclist.errors())
        call extend(issues, loclist.warnings())
        call filter(issues, 'v:val["bufnr"] == buf')
        let seen = {}

        for i in issues
            if i['lnum'] > 0 && !has_key(seen, i['lnum'])
                let seen[i['lnum']] = 1

                let severity = i['type'] ==? 'W' ? 'Warning' : 'Error'
                let type = 'Syntastic' . severity

                call matchaddpos(type, [i['lnum']], 400000)
                let s:next_sign_id += 1
            endif
        endfor
    endif
endfunction " }}}2

" Remove the signs with the given ids from this buffer
function! g:SyntasticSignsNotifier._removeSigns(ids) " {{{2
    if has('signs')
        for s in reverse(copy(a:ids))
            execute "sign unplace " . s
            call remove(self._bufSignIds(), index(self._bufSignIds(), s))
        endfor
    endif
endfunction " }}}2

" Get all the ids of the SyntaxError signs in the buffer
function! g:SyntasticSignsNotifier._bufSignIds() " {{{2
    if !exists("b:syntastic_sign_ids")
        let b:syntastic_sign_ids = []
    endif
    return b:syntastic_sign_ids
endfunction " }}}2

" }}}1

" vim: set sw=4 sts=4 et fdm=marker:
