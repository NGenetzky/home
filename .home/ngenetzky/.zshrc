#!/bin/bash
# zmodload zsh/zprof # top of your .zshrc file

################################################################################
# oh-my-zsh

# ZSH_CUSTOM="${HOME}/.config/zsh/custom/"

# oh-my-zsh
################################################################################

################################################################################
# zgen
#

_zgen_create_save(){
    echo "Creating a zgen save"
    ############################################################################

    ## Load oh-my-zsh base: It's a good idea to load the base components before
    ## specifying any plugins.
    zgen oh-my-zsh

    ## Load oh-my-zsh plugins
    # zgen oh-my-zsh plugins/aws
    # zgen oh-my-zsh plugins/chruby
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/git
    # zgen oh-my-zsh plugins/github
    # zgen oh-my-zsh plugins/pip
    # zgen oh-my-zsh plugins/python
    # zgen oh-my-zsh plugins/rsync
    # zgen oh-my-zsh plugins/screen
    zgen oh-my-zsh plugins/sudo
    # zgen oh-my-zsh plugins/vagrant

    # zgen load /path/to/super-secret-private-plugin
    
    # A next-generation cd command with an interactive filter
    # zgen load b4b4r07/enhancd

    # Add Fish-like autosuggestions to your ZSH
    # zgen load zsh-users/zsh-autosuggestions

    # bulk load
    zgen loadall <<EOPLUGINS
        supercrabtree/k
        zdharma/fast-syntax-highlighting
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-syntax-highlighting
EOPLUGINS
    # ^ can't indent this EOPLUGINS
   
    # ZSH_CUSTOM="${HOME}/.config/zsh/custom/"
    zgen load "${HOME}/.config/zsh/custom/"

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow
    # zgen oh-my-zsh themes/agnoster
    # zgen oh-my-zsh themes/rkj
    # zgen oh-my-zsh themes/rkj-repos
    # zgen oh-my-zsh themes/gnzh
    # zgen load https://github.com/bhilburn/powerlevel9k.git
    # zgen load https://github.com/mafredri/zsh-async # (1/2 for pure)
    # zgen load https://github.com/sindresorhus/pure # (2/2 for pure)
    zgen load denysdovhan/spaceship-prompt spaceship

    ############################################################################
    # save all to init script
    zgen save
}

# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init scipt doesn't exist
if ! zgen saved; then
    _zgen_create_save
fi
unset _zgen_create_save

# zgen
################################################################################

################################################################################
# zplug {
#
#source ~/.zplug/init.zsh
#
## Make sure to use double quotes
#zplug "zsh-users/zsh-history-substring-search"
#
## Supports oh-my-zsh plugins and the like
#zplug "plugins/git",   from:oh-my-zsh
#
# } zplug
################################################################################

# Set up the prompt
# autoload -Uz promptinit
# promptinit
# prompt adam1

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
# 10ms for key sequences
KEYTIMEOUT=1

## compinit handled by zgen
# # compinit: Use modern completion system
# autoload -Uz compinit
# # only check the cached .zcompdump only once a day
# # https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C

setopt histignorealldups sharehistory

# other settings

COMPLETION_WAITING_DOTS="false"

################################################################################
# plugin settings

ENHANCD_FILTER='fzy'

# https://denysdovhan.com/spaceship-prompt/docs/Options.html
SPACESHIP_DIR_TRUNC=0
SPACESHIP_TIME_SHOW=true

# Use with "rkj-repos"
# ZSH_THEME_GIT_PROMPT_PREFIX=""
# PROMPT=$'%{$fg_bold[blue]%}┌─[%{$fg_bold[green]%}%n%b%{$fg[black]%}@%{$fg[cyan]%}%m%{$fg_bold[blue]%}]%{$reset_color%} - %{$fg_bold[blue]%}[%{$fg_bold[white]%}%~%{$fg_bold[blue]%}]%{$reset_color%} - <$(mygit)$(hg_prompt_info)> %{$fg_bold[blue]%}[%b%{$fg[yellow]%}'%D{"%Y-%m-%d %I:%M:%S"}%b$'%{$fg_bold[blue]%}]
# %{$fg_bold[blue]%}└─[%{$fg_bold[magenta]%}%?$(retcode)%{$fg_bold[blue]%}]%{$reset_color%}'

# plugin settings
################################################################################

################################################################################
# zstyle
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# zstyle
################################################################################

# zprof # bottom of .zshrc
