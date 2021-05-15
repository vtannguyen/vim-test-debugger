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
let g:test_debugger#supported_filetypes = ["python"]

" User configurable variables {{{
if !exists('g:enable_vim_test_debugger')
    let g:enable_vim_test_debugger=0
endif
" }}}

" Config for vim-test {{{
if exists('g:test#custom_strategies')
    let test#custom_strategies.vimspector = function('test_debugger#DebugTest')
else
    let g:test#custom_strategies = {'vimspector': function('test_debugger#DebugTest')}
endif
" }}}

" Set up fallback in case filetype is not supported yet {{{
function s:DebugTestFallback() abort
    echo 'Sorry the current filetype ' . &filetype . ' is currently not supported yet.'
endfunction

autocmd BufRead,BufNewFile *
    \ if !exists('b:DebugTest') |
    \   let b:DebugTest = function('<SID>DebugTestFallback') |
    \ endif
" }}}

" Main commands {{{
command! -bar -nargs=0
      \ AddVimspectorConfigurations
      \ call test_debugger#AddVimspectorConfigurations()
command! -bar -nargs=0
      \ DebugModeEnable
      \ call test_debugger#DebugModeEnable()
command! -bar -nargs=0
      \ DebugModeDisable
      \ call test_debugger#DebugModeDisable()
command! -bar -nargs=0
      \ DebugModeToggle
      \ call test_debugger#DebugModeToggle()
" }}}

" Boilerplate {{{
call s:restore_cpo()
" }}}
