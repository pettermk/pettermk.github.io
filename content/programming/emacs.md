Title: Emacs, gdb and pretty printing
Tags: emacs, programming
Date: 2012-01-01
Summary: How to use Emacs as a C++ debugger


Emacs, gdb and pretty printing
=========================

If you enjoy using Emacs for your C++ coding needs, you might want to know how to use it as a full fledged, powerful C++ debugger

The editor
----------

The emacs editor is based on the idea that you can accomplish anything with the keyboard. While I do find that most IDE actually *support* the use of the keyboard through shortcuts, emacs actually *forces* you to learn the shortcuts and thus making you (at least me) a more efficient code editor.

It also handles indentation very gracefully. Entering a tab character from *anywhere on the line* idents the whole line to the appropriate place. I've never seen any other editor do that, and while coding I've never missed the opportunity to insert a tab character somewhere in the line.

I've yet to discover a coding style that emacs does not recognize out of the box, so I've never fussed with setting up syntax highlighting or identation. Emacs can also interact with a lot of language interpreters as well. That means I can launch e.g. Python from within emacs and runs chunks of code or the entire file I am editing. 

I can warmly recommend reading [Emacs as you IDE](http://deep.syminet.com/emacside.html), which basically contains all you need to get started. It also gives you an idea about just how flexible and extensible emacs is.

Debugging
---------

Disclaimer: I've mainly worked with C++ but I believe the following experience translate to a lot of programming languages. 

Emacs has the slightly pompously named Grand Unified Debugger, which basically is an interface between many command line debuggers and the emacs editor. What it means to me is that I can launch gdb from within emacs and leverage the power of command line gdb while following the code in the editor.

It is in fact also very easy to use. To invoke gdb:

	:::bash
	M-x gdb

This asks you how to run gdb. By default the annotate=3 is given, which I believe is necessary for the interaction with emacs. After that, simply enter the path of the binary you have compiled from your code, press enter and watch emacs purr. This gives you a split screen window with gdb on one side and some code on the other side. Gdb commands must be entered in the gdb window, and that can only be interacted with while the code is not running. Make sure to hit C-c C-c to interrupt the code execution to enable gdb interaction (set breakpoints etc.).

The following commands should suffice to be able to mimic most modern IDEs, listed in the order you're likely to need it.

|Command    |Result   |
|:----------|:--------|
|r|Run program|
|C-c C-c|Halt program execution|
|C-x SPACE|Insert breakpoint (from source buffer, program execution must be halted)|
|delete *n*|Delete breakpoint number *n*|
|delete|Delete all breakpoints|
|n|Next line|
|s|Step into|
|f|Finish current function|
|c|Continue until next breakpoint|
|p|Print variable|
|bt|Print current stack backtrace|
|set args *args*|Pass *args* as arguments to the command|
|set args|Clear arguments|
|condition *n* *cond*|Set a condition to breakpoint *n*, e.g. i==4 or name=="Petter"|
|condition *n*|Remove condition on breakpoint *n*|

Pretty printing
---------------
Thus far, we've only covered normal gdb printing, and for C++ this is not very useful. For example, trying to print a string will give you the *memory address* of that string. So we really need to crank up it's usefulness.

Such a shortcoming really puts gdb far behind the competition, but fortunately enough people use gdb that this has been fixed. Download [this script](http://quickgit.kde.org/?p=kdevelop.git&a=blob_plain&h=43e7be3023451410cd984de96a5c0e6445648cf4&hb=1d0811b4cfa15a19f1bfce983a16519a8f577fb5&f=debuggers/gdb/printers/qt4.py) and save it in a suitable location. In you home directory, put the following in .gdbinit

	:::python
	python
	import sys

	sys.path.insert(0, '/suitable/location')
	from qt4 import register_qt4_printers
	register_qt4_printers (None)

	end
	set print pretty 1

I was truly impressed with that scripts, because it would even print some custom datatypes that we have in the codebase we use at work. 

Using GUD
---------
The Grand Unified Debugger has some useful tools too. Truth to be told, I've only used the stack window which helps me move up the callstack to see how my program got to the state it is in right now. Just open the GUD menu in emacs and see what it can do for you!

Slow stepping?
--------------

I don't know how prevalent this bug is, but should you experience extremely slow function stepping in gdb, setting the following environment variable might help you:

	:::bash
	LD_BIND_NOW=1

