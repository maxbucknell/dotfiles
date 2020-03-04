if ! exists(':FZF')
    finish
endif

nnoremap <leader>o :Files<cr>
nnoremap <leader>b :Buffers<cr>

" Making splits a little bit better.
"
" I open splits before opening files because I can never remember the
" keyboard incantations in FZF to open in splits, but I get annoyed for
" the brief moment that the same buffer was shown when I do :vsp or :sp.
" I don't have to have this problem anymore.
nnoremap <leader>v :vnew<cr>:Files<cr>
nnoremap <leader>s :new<cr>:Files<cr>
