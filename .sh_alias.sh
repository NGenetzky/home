#!/bin/sh
# Add the following line to shell init to use this file:
#[ -r "${HOME}/.sh_alias.sh" ] && . "${HOME}/.sh_alias.sh"

# alias gs='git status'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gsm='git submodule'
alias gsubup='git submodule update --init'

alias grc='git rebase --continue'

alias gla='git log --graph --oneline --date-order --decorate=short --all'
alias gld='git log --graph --oneline --date-order --decorate=short'
alias glad='git log --graph --oneline --date-order --decorate=short --all'
alias glaf='git log --graph --oneline --decorate=short --all --first-parent'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
