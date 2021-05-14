" Boilerplate {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

function! test_debugger#InstallConfiguration()
    if !exists('g:vimspector_home')
        let vimspector_home = g:vimspector_home
    else
        let vimspector_home = fnamemodify(g:vim_test_debugger_home . '/../vimspector', ':p')
    endif
    if !isdirectory(vimspector_home)
        echo "It seems the vim plugin vimspector is not installed. Please install it first."
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

" Boilerplate {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
