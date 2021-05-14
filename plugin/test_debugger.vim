function! DebugTest(cmd)
    echo 'It works! Command for running tests: ' . a:cmd
    let pytest_args = split(a:cmd)[1]
    let pytest_location = system('which pytest | tr -d "\n"')
    call vimspector#LaunchWithSettings({ 'configuration': 'pytest', 'PYTEST_ARGS': pytest_args, 'PYTEST_LOCATION': pytest_location })
endfunction

let g:test#custom_strategies = {'vimspector': function('DebugTest')}
let g:test#strategy = 'vimspector'
