set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

" Terminal colours cheatsheet
"
"  0: black
"  1: red
"  2: green
"  3: yellow
"  4: blue
"  5: magenta
"  6: cyan
"  7: white
"
" +8 for bright colours.

let g:colors_name = "maxbucknell"

" Basic settings
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

" Status Line
hi StatusLine cterm=bold ctermfg=1 ctermbg=NONE

" Vim settings
hi VimSet cterm=NONE ctermfg=7 ctermbg=NONE
hi VimOption cterm=NONE ctermfg=7 ctermbg=NONE
hi VimHiAttrib cterm=NONE ctermfg=7 ctermbg=NONE

" Comments are important
hi Comment cterm=NONE ctermfg=2 ctermbg=NONE
hi PreProc cterm=NONE ctermfg=2 ctermbg=NONE

" Invisibles are less important
hi SpecialKey cterm=NONE ctermfg=0 ctermbg=NONE

" Make current line bold
hi CursorLine cterm=bold ctermfg=NONE ctermbg=NONE

" Current search result
hi Search cterm=bold ctermfg=7 ctermbg=0

" Next search result
hi MBSearchNExt cterm=bold ctermfg=7 ctermbg=5

