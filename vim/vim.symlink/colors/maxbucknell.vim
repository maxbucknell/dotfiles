set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

"""""""""""""""""""""""""""""
"
" Terminal colours cheatsheet
"
"  0: black
"  1: red (errors)
"  2: green (comments)
"  3: yellow (search)
"  4: blue
"  5: magenta (current)
"  6: cyan
"  7: white (default)
"
" +8 for bright colours.
"
"""""""""""""""""""""""""""""

let g:colors_name = "maxbucknell"

" Make everything white by default
hi Normal cterm=NONE ctermfg=7 ctermbg=NONE
hi Type cterm=NONE ctermfg=7 ctermbg=NONE
hi Keyword cterm=NONE ctermfg=7 ctermbg=NONE
hi Operator cterm=NONE ctermfg=7 ctermbg=NONE
hi String cterm=NONE ctermfg=7 ctermbg=NONE
hi Number cterm=NONE ctermfg=7 ctermbg=NONE
hi Special cterm=NONE ctermfg=7 ctermbg=NONE
hi Boolean cterm=NONE ctermfg=7 ctermbg=NONE
hi Statement cterm=NONE ctermfg=7 ctermbg=NONE
hi Identifier cterm=NONE ctermfg=7 ctermbg=NONE
hi Constant cterm=NONE ctermfg=7 ctermbg=NONE
hi Define cterm=NONE ctermfg=7 ctermbg=NONE
hi Include cterm=NONE ctermfg=7 ctermbg=NONE
hi Macro cterm=NONE ctermfg=7 ctermbg=NONE

" Residual Vim colors
hi VimSet cterm=NONE ctermfg=7 ctermbg=NONE
hi VimOption cterm=NONE ctermfg=7 ctermbg=NONE
hi VimHiAttrib cterm=NONE ctermfg=7 ctermbg=NONE

" Scalars are cyan
hi String cterm=NONE ctermfg=6 ctermbg=NONE
hi Number cterm=NONE ctermfg=6 ctermbg=NONE
hi Boolean cterm=NONE ctermfg=6 ctermbg=NONE

" Miscellaneous leftovers
hi helpNote cterm=NONE ctermfg=7 ctermbg=NONE
hi MatchParens cterm=NONE ctermfg=7 ctermbg=NONE

" Comments are green
hi Comment cterm=NONE ctermfg=2 ctermbg=NONE
hi PreProc cterm=NONE ctermfg=2 ctermbg=NONE

" Make current line magenta
hi CursorLine cterm=NONE ctermfg=5 ctermbg=NONE

" Current search result yellow
hi Search cterm=NONE ctermfg=3 ctermbg=0
hi MBSearchNext cterm=NONE ctermfg=3 ctermbg=0

" Errors are red
hi SyntasticErrorLine cterm=NONE ctermfg=1 ctermbg=NONE
hi SyntasticWarningLine cterm=NONE ctermfg=1 ctermbg=NONE
hi SyntasticError cterm=NONE ctermfg=1 ctermbg=NONE
hi SyntasticWarning cterm=NONE ctermfg=1 ctermbg=NONE

"""""""""""""
" Status Line
"""""""""""""

hi StatusLine cterm=bold ctermfg=1 ctermbg=NONE
