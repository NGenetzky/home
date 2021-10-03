
# alias gexec="git !exec "
# alias gk="git !exec gitk --all --date-order &"
# alias gkf="git !exec gitk --all --first-parent &"
# alias gg="git !exec git gui &"

# alias gco='git checkout'
# alias gsw='git checkout'
# alias gnb='git checkout -b'
# alias grevert='git checkout --'
# alias gcom='git checkout master'

# alias gc='git commit'
# alias gci='git commit'
# alias gca='git commit -a'
# alias gamend='git commit --amend'

# alias gac='git add -A && git commit -m'
# alias gpp='git pull --prune'
# alias gp='git push origin HEAD'
# alias gcb='git copy-branch-name'
# alias gd='git diff'

# alias gst='git status'
# alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# alias gsts='git status -s'
# alias gstsi='git status -s --ignored'

# alias gb='git branch'
# alias gbr='git branch'

# alias gmrg='git merge --no-ff --edit'
# alias gff='git merge --ff-only '

# alias gsm='git submodule'
# alias gsubup='git submodule update --init'

alias grc='git rebase --continue'

# alias gl='git log --graph --oneline --date-order --decorate=short'
alias gla='git log --graph --oneline --date-order --decorate=short --all'
alias gld='git log --graph --oneline --date-order --decorate=short'
alias glad='git log --graph --oneline --date-order --decorate=short --all'
alias glaf='git log --graph --oneline --decorate=short --all --first-parent'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
