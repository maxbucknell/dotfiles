if !exists("*synstack")
    finish
endif

" Show syntax highlighting groups for word under cursor
"
" This is useful for finding rogue elements I forgot in my colour
" scheme.
function s:SynStack()
  echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
              \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
              \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

nnoremap <Plug>SynStack :call <SID>SynStack()<cr>
