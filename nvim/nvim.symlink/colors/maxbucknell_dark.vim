" maxbucknell_light.vim -- Vim color scheme.
" Author:      Max Bucknell (me@maxbucknell.com)
" Webpage:     https://github.com/maxbucknell/dotfiles
" Description: My colour scheme, bruh.

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "maxbucknell_light"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=15 ctermfg=15 cterm=NONE guibg=#1A0821 guifg=#ECE9ED gui=NONE

    set background=light

    hi NormalFloat ctermbg=15 ctermfg=15 cterm=NONE guibg=#1A0821 guifg=#ECE9ED gui=NONE
    hi NormalNC ctermbg=15 ctermfg=15 cterm=NONE guibg=#4D3A54 guifg=#ECE9ED gui=NONE
    hi NonText ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Comment ctermbg=NONE ctermfg=NONE cterm=bold guibg=NONE guifg=NONE gui=bold
    hi Constant ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Error ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi CocErrorHighlight ctermbg=1 ctermfg=9 cterm=NONE guibg=#CC4129 guifg=#ECC4BD gui=NONE
    hi CocErrorSign ctermbg=1 ctermfg=9 cterm=NONE guibg=#CC4129 guifg=#ECC4BD gui=NONE
    hi CocWarningSign ctermbg=3 ctermfg=15 cterm=NONE guibg=#CCC129 guifg=#EDEABE gui=NONE
    hi CocHintSign ctermbg=4 ctermfg=15 cterm=NONE guibg=#29A1CC guifg=#BEE0EC gui=NONE
    hi CocInfoSign ctermbg=3 ctermfg=15 cterm=NONE guibg=#CC7229 guifg=#EDD3BE gui=NONE
    hi CocErrorVirtualText ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#CC4129 gui=NONE
    hi CocWarningVirtualText ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#CCC129 gui=NONE
    hi CocHintVirtualText ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#29A1CC gui=NONE
    hi CocInfoVirtualText ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#CC7229 gui=NONE
    hi CocWarningHighlight ctermbg=3 ctermfg=15 cterm=NONE guibg=#CCC129 guifg=#EDEABE gui=NONE
    hi CocInfoHighlight ctermbg=3 ctermfg=15 cterm=NONE guibg=#CC7229 guifg=#EDD3BE gui=NONE
    hi CocHintHighlight ctermbg=4 ctermfg=15 cterm=NONE guibg=#29A1CC guifg=#BEE0EC gui=NONE
    hi CocHighlightText ctermbg=5 ctermfg=15 cterm=NONE guibg=#CC29C9 guifg=#ECBCEB gui=NONE
    hi Identifier ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi PreProc ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Special ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Statement ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Type ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Underlined ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi StatusLine ctermbg=15 ctermfg=NONE cterm=NONE guibg=#331E3B guifg=NONE gui=NONE
    hi StatusLineNC ctermbg=15 ctermfg=NONE cterm=NONE guibg=#67556E guifg=NONE gui=NONE
    hi VertSplit ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#C6C3C7 gui=NONE
    hi TabLine ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi TabLineFill ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi TabLineSel ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Title ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi CursorLine ctermbg=15 ctermfg=NONE cterm=NONE guibg=#331E3B guifg=NONE gui=NONE
    hi LineNr ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Visual ctermbg=15 ctermfg=NONE cterm=NONE guibg=#BEE0EC guifg=NONE gui=NONE
    hi VisualNOS ctermbg=15 ctermfg=NONE cterm=NONE guibg=#BEE0EC guifg=NONE gui=NONE
    hi Pmenu ctermbg=15 ctermfg=4 cterm=NONE guibg=#ECE9ED guifg=#29A1CC gui=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi PmenuSel ctermbg=15 ctermfg=15 cterm=NONE guibg=#BEE0EC guifg=#1A0821 gui=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi FoldColumn ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Folded ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi WildMenu ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi DiffAdd ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi DiffChange ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi DiffDelete ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi DiffText ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi IncSearch ctermbg=NONE ctermfg=10 cterm=bold guibg=NONE guifg=#C8ECBD gui=bold
    hi Search ctermbg=2 ctermfg=10 cterm=NONE guibg=#4FCC29 guifg=#C8ECBD gui=NONE
    hi Directory ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi MatchParen ctermbg=5 ctermfg=15 cterm=NONE guibg=#CC29C9 guifg=#ECBCEB gui=NONE
    hi SpellBad ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi SpellCap ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi SpellLocal ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi SpellRare ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi ColorColumn ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi SignColumn ctermbg=15 ctermfg=NONE cterm=NONE guibg=#331E3B guifg=NONE gui=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi ModeMsg ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi MoreMsg ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Question ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Cursor ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi CursorColumn ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi StatusLineTerm ctermbg=15 ctermfg=NONE cterm=NONE guibg=#1A0821 guifg=NONE gui=NONE
    hi StatusLineTermNC ctermbg=15 ctermfg=NONE cterm=NONE guibg=#1A0821 guifg=NONE gui=NONE
    hi RainbowLevel1 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE
    hi RainbowLevel3 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE
    hi RainbowLevel5 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE
    hi RainbowLevel7 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE
    hi RainbowLevel9 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE
    hi RainbowLevel11 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE
    hi RainbowLevel13 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE
    hi RainbowLevel15 ctermbg=15 ctermfg=NONE cterm=NONE guibg=#DFDDE0 guifg=NONE gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=white ctermfg=white cterm=NONE

    set background=light

    hi NormalFloat ctermbg=white ctermfg=white cterm=NONE
    hi NormalNC ctermbg=white ctermfg=white cterm=NONE
    hi NonText ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Comment ctermbg=NONE ctermfg=NONE cterm=bold
    hi Constant ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Error ctermbg=NONE ctermfg=NONE cterm=NONE
    hi CocErrorHighlight ctermbg=darkred ctermfg=red cterm=NONE
    hi CocErrorSign ctermbg=darkred ctermfg=red cterm=NONE
    hi CocWarningSign ctermbg=darkyellow ctermfg=white cterm=NONE
    hi CocHintSign ctermbg=darkblue ctermfg=white cterm=NONE
    hi CocInfoSign ctermbg=darkyellow ctermfg=white cterm=NONE
    hi CocErrorVirtualText ctermbg=NONE ctermfg=darkred cterm=NONE
    hi CocWarningVirtualText ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi CocHintVirtualText ctermbg=NONE ctermfg=darkblue cterm=NONE
    hi CocInfoVirtualText ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi CocWarningHighlight ctermbg=darkyellow ctermfg=white cterm=NONE
    hi CocInfoHighlight ctermbg=darkyellow ctermfg=white cterm=NONE
    hi CocHintHighlight ctermbg=darkblue ctermfg=white cterm=NONE
    hi CocHighlightText ctermbg=darkmagenta ctermfg=white cterm=NONE
    hi CocCodeLens ctermbg=NONE ctermfg=white cterm=
    hi Identifier ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Special ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Statement ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Todo ctermbg=NONE ctermfg=NONENONE cterm=
    hi Type ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=NONE cterm=NONE
    hi StatusLine ctermbg=white ctermfg=NONE cterm=NONE
    hi StatusLineNC ctermbg=white ctermfg=NONE cterm=NONE
    hi VertSplit ctermbg=NONE ctermfg=white cterm=NONE
    hi TabLine ctermbg=NONE ctermfg=NONE cterm=NONE
    hi TabLineFill ctermbg=NONE ctermfg=NONE cterm=NONE
    hi TabLineSel ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Title ctermbg=NONE ctermfg=NONE cterm=NONE
    hi CursorLine ctermbg=white ctermfg=NONE cterm=NONE
    hi LineNr ctermbg=NONE ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=NONE cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Visual ctermbg=white ctermfg=NONE cterm=NONE
    hi VisualNOS ctermbg=white ctermfg=NONE cterm=NONE
    hi Pmenu ctermbg=white ctermfg=darkblue cterm=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PmenuSel ctermbg=white ctermfg=white cterm=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=NONE cterm=NONE
    hi FoldColumn ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Folded ctermbg=NONE ctermfg=NONE cterm=NONE
    hi WildMenu ctermbg=NONE ctermfg=NONE cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=NONE cterm=NONE
    hi DiffAdd ctermbg=NONE ctermfg=NONE cterm=NONE
    hi DiffChange ctermbg=NONE ctermfg=NONE cterm=NONE
    hi DiffDelete ctermbg=NONE ctermfg=NONE cterm=NONE
    hi DiffText ctermbg=NONE ctermfg=NONE cterm=NONE
    hi IncSearch ctermbg=NONE ctermfg=green cterm=bold
    hi Search ctermbg=darkgreen ctermfg=green cterm=NONE
    hi Directory ctermbg=NONE ctermfg=NONE cterm=NONE
    hi MatchParen ctermbg=darkmagenta ctermfg=white cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=NONE cterm=NONE
    hi SpellCap ctermbg=NONE ctermfg=NONE cterm=NONE
    hi SpellLocal ctermbg=NONE ctermfg=NONE cterm=NONE
    hi SpellRare ctermbg=NONE ctermfg=NONE cterm=NONE
    hi ColorColumn ctermbg=NONE ctermfg=NONE cterm=NONE
    hi SignColumn ctermbg=white ctermfg=NONE cterm=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=NONE cterm=NONE
    hi ModeMsg ctermbg=NONE ctermfg=NONE cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Question ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Cursor ctermbg=NONE ctermfg=NONE cterm=NONE
    hi CursorColumn ctermbg=NONE ctermfg=NONE cterm=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=NONE cterm=NONE
    hi StatusLineTerm ctermbg=white ctermfg=NONE cterm=NONE
    hi StatusLineTermNC ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel1 ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel3 ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel5 ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel7 ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel9 ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel11 ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel13 ctermbg=white ctermfg=NONE cterm=NONE
    hi RainbowLevel15 ctermbg=white ctermfg=NONE cterm=NONE
endif

hi link String Constant
hi link Number Constant
hi link WarningMsg Error

let g:terminal_ansi_colors = [
        \ '#ECE9ED',
        \ '#CC4129',
        \ '#4FCC29',
        \ '#CCC129',
        \ '#29A1CC',
        \ '#CC29C9',
        \ '#29CCBA',
        \ '#1A0821',
        \ '#C6C3C7',
        \ '#ECC4BD',
        \ '#C8ECBD',
        \ '#EDEABE',
        \ '#BEE0EC',
        \ '#ECBCEB',
        \ '#ADD3BE',
        \ '#4D3A54',
        \ ]



" Generated with RNB (https://gist.github.com/romainl/5cd2f4ec222805f49eca)
