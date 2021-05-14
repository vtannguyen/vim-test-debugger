" Boilerplate {{{
let s:save_cpo = &cpo
set cpo&vim

function! s:restore_cpo()
  let &cpo = s:save_cpo
  unlet s:save_cpo
endfunction

if exists( 'g:loaded_vim_test_debugger' )
  call s:restore_cpo()
  finish
endif
" }}}

let g:loaded_vim_test_debugger=1
let g:vim_test_debugger_home=expand('<sfile>:p:h:h')

if exists('g:test#custom_strategies')
    let test#custom_strategies.vimspector = function('test_debugger#DebugTest')
else
    let g:test#custom_strategies = {'vimspector': function('test_debugger#DebugTest')}
endif

let g:test#strategy = 'vimspector'

" Boilerplate {{{
call s:restore_cpo()
" }}}
