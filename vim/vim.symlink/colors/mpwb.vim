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
"  8: black
" 15: white
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
hi PreProc cterm=NONE ctermfg=NONE ctermbg=NONE
hi Title cterm=NONE ctermfg=NONE ctermbg=NONE

hi VimHiAttrib cterm=NONE ctermfg=NONE ctermbg=NONE
hi VimOption cterm=NONE ctermfg=NONE ctermbg=NONE

" Scalars are cyan
hi String cterm=NONE ctermfg=4 ctermbg=NONE
hi Number cterm=NONE ctermfg=4 ctermbg=NONE
hi Boolean cterm=NONE ctermfg=4 ctermbg=NONE

" Comments are green
hi Comment cterm=NONE ctermfg=2 ctermbg=NONE
hi Todo cterm=bold ctermbg=2 ctermfg=7

" Search is bright blue
hi Search ctermfg=0 ctermbg=14

" Chrome is magenta
hi VertSplit ctermfg=5 ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=5 ctermbg=NONE cterm=bold
hi StatusLineNC ctermfg=5 ctermbg=NONE cterm=NONE

hi Visual ctermfg=15 ctermbg=0

hi LineNr cterm=NONE ctermfg=5 ctermbg=NONE
hi CursorLine cterm=bold
hi CursorLineNr cterm=bold ctermfg=15 ctermbg=5

" LSP hints
hi ErrorMsg cterm=NONE ctermfg=7 ctermbg=1
hi Question cterm=NONE ctermfg=7 ctermbg=4
hi SpellLocal cterm=NONE ctermfg=3 ctermbg=NONE
hi SpellRare cterm=NONE ctermfg=3 ctermbg=NONE
hi SpellCap cterm=NONE ctermfg=0 ctermbg=3
hi SpellBad cterm=NONE ctermfg=7 ctermbg=1

hi link LspDiagSignInfoText Question
hi link LspDiagSignWarningText Question

hi PMenu cterm=NONE ctermfg=7 ctermbg=5
hi PMenuSel cterm=bold ctermfg=8 ctermbg=3

" Misc cleanup
hi pandocBlockQuote cterm=NONE ctermfg=0 ctermbg=NONE
