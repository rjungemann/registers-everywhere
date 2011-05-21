Registers Everywhere
====================

A pathogen-compatible plugin for vim. Registers Everywhere lets you persist the contents of a register to a file and load it later. You can use this to share registers between instances of vim. It can also be useful when using console vim inside of screen or tmux, because these tools in some circumstances can break clipboard support.

Another feature of Registers Everywhere is to persist a register to the clipboard or to restore a register from the clipboard.

This plugin works in console vim and MacVim.

Installation
------------

1. Install pathogen.
2. Clone this repository into your ~/.vim/bundle directory. http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen.

Instructions
------------

1. Type some text and select it. Try yanking to the <code>a</code> register by typing <code>"ay</code>.
2. Persist the register by typing <code>\ca</code>, where <code>\</code> is your "leader" key, <code>c</code> stands for "copy register to", and <code>a</code> is the register you wish to persist.
3. Open a new instance of vim. Restore register <code>a</code> by typing <code>\va</code>.
4. You can then pull in the contents of register <code>a</code> by typing <code>"ap</code>.
5. You can also persist register <code>a</code> to the clipboard by typing <code>\Ca</code> and restore the clipboard to register <code>a</code> by typing <code>\Va</code>.

To do
-----

* Support for swapping registers
