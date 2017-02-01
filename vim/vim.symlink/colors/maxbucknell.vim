set background=light
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
"  6: cyan (scalars)
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

" Residual Markdown colors
hi markdownH1 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH2 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH3 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH4 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH5 cterm=NONE ctermbg=NONE ctermfg=7
hi markdownH6 cterm=NONE ctermbg=NONE ctermfg=7

" Miscellaneous leftovers
hi helpNote cterm=NONE ctermfg=7 ctermbg=NONE
hi MatchParen cterm=NONE ctermfg=7 ctermbg=5

" Scalars are cyan
hi String cterm=NONE ctermfg=6 ctermbg=NONE
hi Number cterm=NONE ctermfg=6 ctermbg=NONE
hi Boolean cterm=NONE ctermfg=6 ctermbg=NONE

" Comments are green
hi Comment cterm=NONE ctermfg=2 ctermbg=NONE

" Preprocessor statements aren't comments.
hi PreProc cterm=NONE ctermfg=7 ctermbg=NONE

" JSDoc comments are comments.
hi jsDocTags cterm=NONE ctermfg=2 ctermbg=NONE
hi jsDocType cterm=NONE ctermfg=2 ctermbg=NONE
hi jsDocParam cterm=NONE ctermfg=2 ctermbg=NONE
hi jsDocTypeNoParam cterm=NONE ctermfg=2 ctermbg=NONE
hi jsDocSeeTag cterm=NONE ctermfg=2 ctermbg=NONE

" Line numbers are grey
hi LineNr cterm=NONE ctermfg=7 ctermbg=NONE

" Current search result yellow
hi Search cterm=NONE ctermfg=0 ctermbg=3
hi MBSearchNext cterm=NONE ctermfg=0 ctermbg=3

" Errors are red

" Make current line magenta
hi CursorLine cterm=NONE ctermfg=4 ctermbg=NONE
hi CursorLineNr cterm=NONE ctermfg=4 ctermbg=NONE

""""""""
" Visual
""""""""

hi Visual cterm=NONE ctermbg=7 ctermfg=0

"""""""""""""
" Status Line
"""""""""""""

hi StatusLine cterm=NONE ctermfg=7 ctermbg=4
hi StatusLineNC cterm=NONE ctermfg=0 ctermbg=7

"""""""
" Signs
"""""""

hi SignColumn cterm=NONE ctermbg=0 ctermfg=0

""""""""
" Vdebug
""""""""

hi DbgBreakptLine cterm=NONE ctermfg=5 ctermbg=NONE
hi DbgBreakptSign cterm=NONE ctermfg=5 ctermbg=5
hi DbgCurrentLine cterm=NONE ctermfg=7 ctermbg=5
hi DbgCurrentSign cterm=NONE ctermfg=5 ctermbg=5

"""""
" Ale
"""""

hi ALEWarningSign cterm=NONE ctermbg=3 ctermfg=3
hi ALEErrorSign cterm=NONE ctermbg=1 ctermfg=1

"""""""""""
" UltiSnips
"""""""""""

hi snipLeadingSpaces cterm=NONE ctermbg=NONE ctermfg=NONE
