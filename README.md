# Vim test debugger - run vimspector as a stragtegy for vim-test

## Description
The plugin allow you to use [vimspector](https://github.com/puremourning/vimspector) as a strategy of [vim-test](https://github.com/vim-test/vim-test), which helps to debug code faster and easier.

## Installation
The plugin depends on 2 vim plugins [vimspector](https://github.com/puremourning/vimspector) and [vim-test](https://github.com/vim-test/vim-test).
Make sure you installed these 2 plugins before installing vim-test-debugger.

To install vim-test-debugger with [vim-plug](https://github.com/junegunn/vim-plug), please add this to your .vimrc:
```
Plug 'vtannguyen/vim-test-debugger'
```

Then to install and setup the configuration:
```
:PlugInstall
:AddVimspectorConfigurations
```

## Support languages
Currently, the plugin only supports python.
The support for the other languages will be added in future.

## Usage
By default, the plugin is not enabled.
Your [vim-test](https://github.com/vim-test/vim-test) would use the default strategy setup by user.
You can enable the vim-test-debugger plugin to debug test with [vimspector](https://github.com/puremourning/vimspector) by running:
```
:DebugModeEnable
```
To disable vim-test-debugger and go back to your default [vim-test](https://github.com/vim-test/vim-test) strategy, please run:
```
:DebugModeDisable
```
To toggle enable/disable of the plugin, please run:
```
:DebugModeToggle
```
You could also make vim-test-debugger enable by default by setting in your vimrc:
```
let g:enable_vim_test_debugger = 1
```

## License
MIT
