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

let s:is_dark=(&background == 'dark')

" \ 'mpwb_green': '#20A92E',
call extend(v:colornames, {
            \ 'mpwb_fg': '#201C22',
            \ 'mpwb_bg': '#E7E3E9',
            \ 'mpwb_tintbg': '#FCF7FE',
            \ 'mpwb_red': '#AD1C22',
            \ 'mpwb_orange': '#AF5F27',
            \ 'mpwb_yellow': '#AD9622',
            \ 'mpwb_green': '#20A951',
            \ 'mpwb_cyan': '#20A9AE',
            \ 'mpwb_blue': '#2059AF',
            \ 'mpwb_purple': '#721CAF',
            \ 'mpwb_magenta': '#AB177B',
            \ 'mpwb_callout_note': '#CCD7E8',
            \ 'mpwb_callout_tip': '#D2E8CC',
            \ 'mpwb_callout_important': '#E8CCCC',
            \ 'mpwb_callout_warning': '#E8E3CC',
            \ 'mpwb_cursorline': '#c6c2c8'
            \ }, 'force')

if s:is_dark
    call extend(v:colornames, {
                \ 'mpwb_fg': '#E7E3E9',
                \ 'mpwb_bg': '#201C22',
                \ 'mpwb_tintbg': '#3B3440',
                \ 'mpwb_callout_note': '#002A68',
                \ 'mpwb_callout_tip': '#156800',
                \ 'mpwb_callout_important': '#680000',
                \ 'mpwb_callout_warning': '#685700',
                \ 'mpwb_cursorline': '#29242C',
                \ }, 'force')
endif

hi Normal guifg=mpwb_fg guibg=mpwb_bg
hi Type cterm=NONE guifg=mpwb_fg
hi Keyword cterm=NONE guifg=mpwb_fg
hi Operator cterm=NONE guifg=mpwb_fg
hi Special cterm=NONE guifg=mpwb_fg
hi Statement cterm=NONE guifg=mpwb_fg
hi Identifier cterm=NONE guifg=mpwb_fg
hi Constant cterm=NONE guifg=mpwb_fg
hi Define cterm=NONE guifg=mpwb_fg
hi Include cterm=NONE guifg=mpwb_fg
hi Macro cterm=NONE guifg=mpwb_fg
hi PreProc cterm=NONE guifg=mpwb_fg

hi VimHiAttrib cterm=NONE guifg=mpwb_fg
hi VimOption cterm=NONE guifg=mpwb_fg

" Scalars are cyan
hi String cterm=NONE guifg=mpwb_cyan
hi Number cterm=NONE guifg=mpwb_cyan
hi Boolean cterm=NONE guifg=mpwb_cyan

" Comments are green
hi Comment cterm=NONE guifg=mpwb_green
hi Todo cterm=bold guibg=mpwb_green guifg=mpwb_bg

" Search is bright blue
hi Search guifg=mpwb_fg guibg=mpwb_cyan
hi! link MatchParen Search

" Chrome is purple
hi VertSplit guifg=mpwb_purple cterm=NONE
hi StatusLine guifg=mpwb_purple cterm=bold
hi StatusLineNC guifg=mpwb_purple cterm=NONE

hi Visual guibg=mpwb_fg guifg=mpwb_bg

hi LineNr cterm=NONE guifg=mpwb_purple
hi CursorLine cterm=bold guibg=mpwb_cursorline
hi CursorLineNr cterm=bold guifg=mpwb_bg guibg=mpwb_purple

" LSP hints
hi ErrorMsg cterm=NONE guifg=mpwb_bg guibg=mpwb_red
hi Question cterm=NONE guifg=mpwb_bg guibg=mpwb_blue
hi SpellLocal cterm=NONE guifg=mpwb_yellow guibg=NONE
hi SpellRare cterm=NONE guifg=mpwb_yellow guibg=NONE
hi SpellCap cterm=NONE guifg=mpwb_fg guibg=mpwb_yellow
hi SpellBad cterm=NONE guifg=mpwb_bg guibg=mpwb_red

hi link LspDiagSignInfoText Question
hi link LspDiagSignWarningText Question

hi PMenu cterm=NONE guifg=mpwb_fg guibg=mpwb_purple
hi PMenuSel cterm=bold guifg=mpwb_bg guibg=mpwb_yellow
hi ALEVirtualTextError cterm=bold guifg=mpwb_fg guibg=mpwb_yellow
hi ALEVirtualTextWarning cterm=bold guifg=mpwb_fg guibg=mpwb_yellow
hi LspSigActiveParameter cterm=bold guifg=mpwb_bg guibg=mpwb_purple

" Misc cleanup
hi pandocBlockQuote cterm=NONE guifg=mpwb_fg
hi link elixirUnusedVariable Normal

" Notes in Quarto

hi Title cterm=bold guifg=mpwb_fg
hi link pandocAtxHeaderMark Title
hi link pandocAtxStart Title
hi link pandocNoFormatted Keyword
hi link pandocDelimitedCodeBlockLanguage Normal
hi pandocBlockQuote cterm=italic
hi pandocHRule guibg=mpwb_tintbg

hi quartoCalloutNote guibg=mpwb_callout_note
hi quartoCalloutWarning guibg=mpwb_callout_warning
hi quartoCalloutImportant guibg=mpwb_callout_important
hi quartoCalloutTip guibg=mpwb_callout_tip
hi quartoCalloutCaution guibg=mpwb_callout_warning

