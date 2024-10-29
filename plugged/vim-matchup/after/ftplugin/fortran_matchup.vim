" vim match-up - even better matching
"
" Maintainer: Andy Massimino
" Email:      a@normed.space
"

if !exists('g:loaded_matchup') || !exists('b:did_ftplugin')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

call matchup#util#patch_match_words('\<if', '\<if\>\g{hlend}')
call matchup#util#patch_match_words(
            \ '\<else\s*\%(if',
            \ '\<else\g{hlend}\s*\%(if\g{hlend}')

call matchup#util#append_match_words(
      \ '^\s*#\s*if\(\|def\|ndef\)\>'
      \ . ':^\s*#\s*elif\>:^\s*#\s*else\>'
      \ . ':^\s*#\s*endif\>')

let &cpo = s:save_cpo

" vim: fdm=marker sw=2

