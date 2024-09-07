if ! exists('g:animate#loaded')
  finish
endif

let g:animate#distribute_space = 0
let g:animate#duration = 140.0

let g:fzf_layout = {
    \ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.3)'
\ }

nnoremap <leader>v :vnew<cr>:vertical resize 1<cr>:call animate#window_percent_width(0.5)<cr>
nnoremap <leader>s :new<cr>:resize 1<cr>:call animate#window_percent_height(0.5)<cr>
