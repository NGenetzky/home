#!/bin/sh

# git

# alias gs='git status'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gla='git log --graph --oneline --date-order --decorate=short --all'
alias glad='git log --graph --oneline --date-order --decorate=short --all'
alias glaf='git log --graph --oneline --decorate=short --all --first-parent'
alias gld='git log --graph --oneline --date-order --decorate=short'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias grc='git rebase --continue'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gsm='git submodule'
alias gsubup='git submodule update --init'
