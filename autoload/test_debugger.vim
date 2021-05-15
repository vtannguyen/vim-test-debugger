" Boilerplate {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

function! test_debugger#AddVimspectorConfigurations()
    if !exists('g:vimspector_home')
        let vimspector_home = g:vimspector_home
    else
        let vimspector_home = fnamemodify(g:vim_test_debugger_home . '/../vimspector', ':p')
    endif
    if !isdirectory(vimspector_home)
        echo "It seems the vim plugin vimspector is not installed. Please install it first."
        return
    endif
    let config_dir = vimspector_home . '/configurations/'
    let os_config_dir = ''
    for path in split(globpath(config_dir, '*'), '\n')
        if isdirectory(path)
            let os_config_dir = path
            break
        endif
    endfor
    let final_dir = os_config_dir . "/python"
    call mkdir(final_dir, "p")
    let res = system('cp ' . g:vim_test_debugger_home . '/vim-test-debugger.json ' . final_dir)
endfunction

function! test_debugger#DebugModeEnable()
    if !g:enable_vim_test_debugger
        let g:enable_vim_test_debugger = 1
        let s:save_stategy = g:test#strategy
        let g:test#strategy = 'vimspector'
    endif
endfunction

function! test_debugger#DebugModeDisable()
    if g:enable_vim_test_debugger
        let g:enable_vim_test_debugger = 0
        let g:test#strategy = s:save_stategy
    endif
endfunction

function! test_debugger#DebugModeToggle()
    if g:enable_vim_test_debugger
        call test_debugger#DebugModeDisable()
    else
        call test_debugger#DebugModeEnable()
    endif
endfunction

function! test_debugger#DebugTest(cmd)
    call b:DebugTest(a:cmd)
endfunction

" Boilerplate {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
