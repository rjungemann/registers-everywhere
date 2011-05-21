Registers Everywhere
====================

A pathogen-compatible plugin for vim. Registers Everywhere lets you persist the contents of a register to a file and load it later. You can use this to share registers between instances of vim. It can also be useful when using console vim inside of screen or tmux, because these tools in some circumstances can break clipboard support.

Another feature of Registers Everywhere is to persist a register to the clipboard or to restore a register from the clipboard.

This plugin works in console vim and MacVim.

You can customize where registers get stored by setting the `g:registers_everywhere_path`.

Installation
------------

1. Install pathogen.
2. Clone this repository into your ~/.vim/bundle directory. http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen.

Instructions
------------

1. Type some text and select it. Try yanking to the `a` register by typing `"ay`.
2. Persist the register by typing `\ca`, where `\` is your "leader" key, `c` stands for "copy register to", and `a` is the register you wish to persist.
3. Open a new instance of vim. Restore register `a` by typing `\va`.
4. You can then pull in the contents of register `a` by typing `"ap`.
5. You can also persist register `a` to the clipboard by typing `\Ca` and restore the clipboard to register `a` by typing `\Va`.

To do
-----

* Support for swapping registers
* Operator for persisting a register to an arbitrary file
