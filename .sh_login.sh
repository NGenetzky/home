#!/bin/sh
# Add the following line to shell init to use this file:
#[ -r "${HOME}/.sh_login.sh" ] && . "${HOME}/.sh_login.sh"

tty -s && mesg n 2> /dev/null || true

# Add local paths to PATH
export PATH="${HOME}/bin:${HOME}/.local/bin:$PATH"

# Created by `pipx` on...
#export PATH="$PATH:/root/.local/bin"

if command -v vim > '/dev/null' ; then
    export EDITOR='vim'
    export VISUAL='vim'
fi

# Preferred editor for local and remote sessions
#if [ -n "${SSH_CONNECTION}" ]; then
#  export EDITOR='vim'
#else
#  export EDITOR='vim'
#fi

