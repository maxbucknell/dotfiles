hi clear

if exists("syntax_on")
  syntax reset
endif

"""""""""""""""""""""""""""""
"
" Terminal colours cheatsheet
"
"  0: foreground
"  1: red
"  2: green
"  3: yellow
"  4: blue
"  5: magenta
"  6: cyan
"  7: background
"
" +8 for bright colours.
"
"""""""""""""""""""""""""""""

let g:colors_name = "mpwb"

hi Normal cterm=italic ctermfg=NONE ctermbg=NONE
hi Type cterm=NONE ctermfg=NONE ctermbg=NONE
hi Keyword cterm=NONE ctermfg=NONE ctermbg=NONE
hi Operator cterm=NONE ctermfg=NONE ctermbg=NONE
hi Special cterm=NONE ctermfg=NONE ctermbg=NONE
hi Statement cterm=NONE ctermfg=NONE ctermbg=NONE
hi Identifier cterm=NONE ctermfg=NONE ctermbg=NONE
hi Constant cterm=NONE ctermfg=NONE ctermbg=NONE
hi Define cterm=NONE ctermfg=NONE ctermbg=NONE
hi Include cterm=NONE ctermfg=NONE ctermbg=NONE
hi Macro cterm=NONE ctermfg=NONE ctermbg=NONE

hi VimHiAttrib cterm=NONE ctermfg=NONE ctermbg=NONE
hi VimOption cterm=NONE ctermfg=NONE ctermbg=NONE

" Scalars are cyan
hi String cterm=NONE ctermfg=4 ctermbg=NONE
hi Number cterm=NONE ctermfg=4 ctermbg=NONE
hi Boolean cterm=NONE ctermfg=4 ctermbg=NONE

" Comments are green
hi Comment cterm=NONE ctermfg=2 ctermbg=NONE
hi Todo cterm=bold ctermbg=2 ctermfg=7

hi CursorLine cterm=bold

hi Search ctermfg=0 ctermbg=3

hi VertSplit ctermfg=5 ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=5 ctermbg=NONE cterm=bold
hi StatusLineNC ctermfg=5 ctermbg=NONE cterm=NONE

hi Visual ctermfg=7 ctermbg=0

if &background == 'dark'
    hi LineNr cterm=NONE ctermfg=15 ctermbg=NONE
    hi CursorLineNr cterm=bold ctermfg=15 ctermbg=0
endif

if &background == 'light'
    hi LineNr cterm=NONE ctermfg=0 ctermbg=NONE
    hi CursorLineNr cterm=bold ctermfg=0 ctermbg=NONE
endif
