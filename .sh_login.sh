#!/bin/sh
# Add the following line to shell init to use this file:
#[ -r "${HOME}/.sh_login.sh" ] && . "${HOME}/.sh_login.sh"
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# SSH_CONNECTION
# Identifies the client and server ends of the connection.
# The variable contains four space-separated values: client IP address,
# client port number, server IP address, and server port number.
if [ -n "$SSH_CONNECTION" ] ; then
    # Skip byobu when connecting via ssh.
    true
else
    _byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
fi
