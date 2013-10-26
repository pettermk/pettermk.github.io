Title: How to read email in Emacs
Tags: emacs, email, lisp, terminal
Date: 2012-06-07
Summary: You've stumbled across emacs' native email capabilities and found them convoluted and difficult to use. I present a different approach, leveraging the power of the multi-term smart emacs terminal to run you favorite email client, alpine presumably, within emacs.

Emacs multi-term
================

First of all you will need to familiarize yourself with the multi-term terminal package for emacs. It is very simple to install, just follow the steps at the [emacs wiki](http://emacswiki.org/emacs/MultiTerm). 

To start off, open emacs, press M-x (emacs for Alt+x on most systems), enter 'multi-term' and see the terminal window open. This is a fully capable terminal that can run most command line application. We will run alpine, but the so inclined can of course run mutt or any other command line email client.

Configure multi-term for alpine
-------------------------------

There is one big catch with running alpine within emacs; sending an email requires you to press Ctrl-x, which is going to be interpreted as an emacs command rather than an alpine command.

Emacs does facilitate customizing new keybindings (pretty much the idea behind emacs actually), so we will make a new function that sends the system character "C-x" to the terminal window. To make sure this is available in terminal mode we will put the new functions inside the multi-term.el file you just downloaded. Browse to the section where multi-term.el defines it's keybindings and add the last line with the pinesend keybinding. 

	:::elisp
    (defcustom term-bind-key-alist
	  '(
        ("C-c C-c" . term-interrupt-subjob)
        ("C-c x"   . multi-term-pinesend)

This binds the key combination Ctrl-c x to the funtion multi-term-pinesend. This function does of course not exist yet, so we will create it at the bottom of the file, after all the original function definitions take place.

	:::elisp
    (defun multi-term-pinesend ()
      "Send C-x to send pine email"
        (interactive)
	    (term-send-raw-string "\C-x"))
