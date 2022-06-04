highlight clear

if exists("syntax_on")
  syntax reset
endif

exec "source " . expand('<sfile>:p:h') . "/default-light.vim"

let colors_name = "dim"

" In diffs, added lines are green, changed lines are yellow, deleted lines are
" red, and changed text (within a changed line) is bright yellow and bold.
highlight DiffAdd        ctermfg=0    ctermbg=2
highlight DiffChange     ctermfg=0    ctermbg=3
highlight DiffDelete     ctermfg=0    ctermbg=1
highlight DiffText       ctermfg=0    ctermbg=11   cterm=bold

" Invert selected lines in visual mode
highlight Visual         ctermfg=NONE ctermbg=NONE cterm=inverse

" Highlight search matches in black, with a yellow background
highlight Search         ctermfg=0    ctermbg=11

highlight LineNr       ctermfg=3
highlight CursorLineNr ctermfg=7
highlight Comment      ctermfg=8
highlight ColorColumn  ctermfg=7    ctermbg=8
highlight Folded       ctermfg=7    ctermbg=8
highlight FoldColumn   ctermfg=7    ctermbg=8
highlight Pmenu        ctermfg=15   ctermbg=8
highlight PmenuSel     ctermfg=8    ctermbg=15
highlight SpellCap     ctermfg=7    ctermbg=8
highlight StatusLine   ctermfg=15   ctermbg=8    cterm=bold
highlight StatusLineNC ctermfg=7    ctermbg=8    cterm=NONE
highlight VertSplit    ctermfg=7    ctermbg=8    cterm=NONE
highlight SignColumn                ctermbg=8

highlight link DimFzfFg     Normal
highlight link DimFzfBg     Normal
highlight link DimFzfFgPlus PmenuSel
highlight link DimFzfBgPlus PmenuSel
highlight link DimFzfInfo   Comment

highlight DimFzfHl      ctermfg=2
highlight DimFzfPrompt  ctermfg=12
highlight DimFzfPointer ctermfg=1
highlight DimFzfMarker  ctermfg=9

let g:fzf_colors = { 'fg':      ['fg', 'DimFzfFg'],
                   \ 'bg':      ['bg', 'DimFzfBg'],
                   \ 'hl':      ['fg', 'DimFzfHl'],
                   \ 'fg+':     ['fg', 'DimFzfFgPlus'],
                   \ 'bg+':     ['bg', 'DimFzfbgPlus'],
                   \ 'hl+':     ['fg', 'DimFzfHl'],
                   \ 'info':    ['fg', 'DimFzfInfo'],
                   \ 'prompt':  ['fg', 'DimFzfPrompt'],
                   \ 'pointer': ['fg', 'DimFzfPointer'],
                   \ 'marker':  ['fg', 'DimFzfMarker']}
