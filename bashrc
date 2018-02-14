#!/bin/bash

# Test for an interactive shell.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export TZ=:/etc/localtime
export PAGER=less
export EDITOR=vim
export PATH=$HOME/.cabal/bin:$PATH
export GOPATH=$HOME/gopath
