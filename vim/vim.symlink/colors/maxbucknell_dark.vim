set background=dark
hi clear

if exists("syntax on")
  syntax reset
endif

runtime "colors/maxbucknell.vim"

let g:colors_name = "maxbucknell_dark"

" Make everything white by default
hi Normal cterm=NONE ctermfg=7 ctermbg=NONE
hi Type cterm=NONE ctermfg=7 ctermbg=NONE
hi Keyword cterm=NONE ctermfg=7 ctermbg=NONE
hi Operator cterm=NONE ctermfg=7 ctermbg=NONE
hi Special cterm=NONE ctermfg=7 ctermbg=NONE
hi Statement cterm=NONE ctermfg=7 ctermbg=NONE
hi Identifier cterm=NONE ctermfg=7 ctermbg=NONE
hi Constant cterm=NONE ctermfg=7 ctermbg=NONE
hi Define cterm=NONE ctermfg=7 ctermbg=NONE
hi Include cterm=NONE ctermfg=7 ctermbg=NONE
hi Macro cterm=NONE ctermfg=7 ctermbg=NONE

" Residual Less colors
hi lessFunction cterm=NONE ctermfg=7 ctermbg=NONE
hi lessCssAttribute cterm=NONE ctermfg=7 ctermbg=NONE

" Residual Vim colors
hi VimSet cterm=NONE ctermfg=7 ctermbg=NONE
hi VimOption cterm=NONE ctermfg=7 ctermbg=NONE
hi VimHiAttrib cterm=NONE ctermfg=7 ctermbg=NONE

" Residual Zsh colors
hi ZshDeref cterm=NONE ctermfg=7 ctermbg=NONE
hi ZshShortDeref cterm=NONE ctermfg=7 ctermbg=NONE
hi ZshSubstDelim cterm=NONE ctermfg=7 ctermbg=NONE

" Residual XML colors
hi xmlProcessingDelim cterm=NONE ctermfg=7 ctermbg=NONE
hi xmlAttribPunct cterm=NONE ctermfg=7 ctermbg=NONE

" Miscellaneous leftovers
hi helpNote cterm=NONE ctermfg=7 ctermbg=NONE
hi MatchParen cterm=NONE ctermfg=7 ctermbg=5

" Line numbers are grey
hi LineNr cterm=NONE ctermfg=8 ctermbg=NONE
"
" Residual Markdown colors
hi markdownH1 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH2 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH3 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH4 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH5 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH6 cterm=NONE ctermbg=NONE ctermfg=7
