hi clear
if exists("syntax_on")
  syntax reset
endif

runtime colors/gruvbox.vim
let g:colors_name = 'maxbucknell'

hi clear NormalFloat
hi link NormalFloat  Normal

hi ActiveWindow guibg=#282828 ctermbg=235
hi InactiveWindow guibg=#32302f ctermbg=236
