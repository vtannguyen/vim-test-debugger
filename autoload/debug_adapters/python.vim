function! debug_adapters#python#DebugTest(cmd)
    let test_object = getcwd() . '/' . split(a:cmd)[1]
    let test_framework = split(a:cmd)[0]
    let test_binary_path = system('which ' . test_framework . ' | tr -d "\n"')
    let work_dir = getcwd()
    call vimspector#LaunchWithSettings({ 
                \ 'configuration': 'vim test debugger python',
                \ 'TEST_OBJECT': test_object,
                \ 'TEST_BINARY_PATH': test_binary_path,
                \ 'WORK_DIR': work_dir })
endfunction
