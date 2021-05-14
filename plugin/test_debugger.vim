let g:vim_test_debugger_home=expand('<sfile>:p:h:h')

function! DebugTest(cmd)
    echo 'It works! Command for running tests: ' . a:cmd
    let pytest_args = getcwd() . '/' . split(a:cmd)[1]
    let pytest_location = system('which pytest | tr -d "\n"')
    call vimspector#LaunchWithSettings({ 'configuration': 'debug pytest', 'PYTEST_ARGS': pytest_args, 'PYTEST_LOCATION': pytest_location })
endfunction

let g:test#custom_strategies = {'vimspector': function('DebugTest')}
let g:test#strategy = 'vimspector'
