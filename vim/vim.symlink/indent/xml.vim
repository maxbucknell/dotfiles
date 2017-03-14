" Language:	xml
" Maintainer:	Johannes Zellner <johannes@zellner.org>
" Last Change:	2012 Jul 25
" Notes:	1) does not indent pure non-xml code (e.g. embedded scripts)
"		2) will be confused by unbalanced tags in comments
"		or CDATA sections.
"		2009-05-26 patch by Nikolai Weibull
" TODO: 	implement pre-like tags, see xml_indent_open / xml_indent_close

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1
let s:keepcpo= &cpo
set cpo&vim

" [-- local settings (must come before aborting the script) --]
setlocal indentexpr=XmlIndentGet(v:lnum,1)
setlocal indentkeys=o,O,*<Return>,<>>,<<>,/,{,}

" [-- check if it's xml --]
fun! <SID>XmlIndentSynCheck(lnum)
    if '' != &syntax
	let syn1 = synIDattr(synID(a:lnum, 1, 1), 'name')
	let syn2 = synIDattr(synID(a:lnum, strlen(getline(a:lnum)) - 1, 1), 'name')
	if '' != syn1 && syn1 !~ 'xml' && '' != syn2 && syn2 !~ 'xml'
	    " don't indent pure non-xml code
	    return 0
	elseif syn1 =~ '^xmlComment' && syn2 =~ '^xmlComment'
	    " indent comments specially
	    return -1
	endif
    endif
    return 1
endfun

fun! XmlPrevLine(line)
  " 'Checking previous line:'
  if (match(a:line, '^<?.*?>') != -1)
    " 'Doctype'
    return 0
  elseif (match(a:line, '/>') != -1) || (match(a:line, '</') != -1)
    " 'Is closing tag line, no change below.'
    return 0
  elseif (match(a:line, '<') != -1) || (match(a:line, '>') != -1)
    " 'Is opening tag, time to indent.'
    return 1
  else
    " 'No change'
    return 0
  endif
endfun

fun! XmlCurrentLine(line)
  " 'Checking current line:'
  if (match(a:line, '^\s*/\{0,1}>') != -1) || (match(a:line, '</') != -1)
    " 'Is closing tag line'
    return -1
  else
    " 'Is normal line, no change'
    return 0
  endif
endfun

fun! XmlIndentGet(lnum, use_syntax_check)
  " Find a non-empty line above the current line.
  let lnum = prevnonblank(a:lnum - 1)

  " Hit the start of the file, use zero indent.
  if lnum == 0
    return 0
  endif

  if a:use_syntax_check
    let check_lnum = <SID>XmlIndentSynCheck(lnum)
    let check_alnum = <SID>XmlIndentSynCheck(a:lnum)
    if 0 == check_lnum || 0 == check_alnum
      return indent(a:lnum)
    elseif -1 == check_lnum || -1 == check_alnum
      return -1
    endif
  endif

  let cur = getline(a:lnum)
  let pre = getline(lnum)

  let ind = indent(lnum) + &sw * (XmlPrevLine(pre) + XmlCurrentLine(cur))

  return ind
endfun

let &cpo = s:keepcpo
unlet s:keepcpo

" vim:ts=8
