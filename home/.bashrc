#!/usr/bin/env bash

activate_bashit(){
  local bashitdir="${1-${HOME}/.bash_it}"

  if [ ! -d ${bashitdir} ]; then
    return 1
  fi

  # Path to the bash it configuration
  export BASH_IT="${bashitdir}"


  # Load a custom theme file
  export BASH_IT_THEME='nwinkler'

  # (Advanced): Change this to the name of your remote repo if you
  # cloned bash-it with a remote other than origin such as `bash-it`.
  # export BASH_IT_REMOTE='bash-it'

  # Your place for hosting Git repos. I use this for private repos.
  export GIT_HOSTING='git@git.domain.com'

  # Don't check mail when opening terminal.
  unset MAILCHECK

  # Change this to your console based IRC client of choice.
  export IRC_CLIENT='irssi'

  # Set this to the command you use for todo.txt-cli
  export TODO="t"

  # Set this to false to turn off version control status checking within the prompt for all themes
  export SCM_CHECK=true

  # Set Xterm/screen/Tmux title with only a short hostname.
  # Uncomment this (or set SHORT_HOSTNAME to something else),
  # Will otherwise fall back on $HOSTNAME.
  #export SHORT_HOSTNAME=$(hostname -s)

  # Set Xterm/screen/Tmux title with only a short username.
  # Uncomment this (or set SHORT_USER to something else),
  # Will otherwise fall back on $USER.
  #export SHORT_USER=${USER:0:8}

  # Set Xterm/screen/Tmux title with shortened command and directory.
  # Uncomment this to set.
  #export SHORT_TERM_LINE=true

  # Set vcprompt executable path for scm advance info in prompt (demula theme)
  # https://github.com/djl/vcprompt
  #export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

  # (Advanced): Uncomment this to make Bash-it reload itself automatically
  # after enabling or disabling aliases, plugins, and completions.
  # export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

  # Uncomment this to make Bash-it create alias reload.
  # export BASH_IT_RELOAD_LEGACY=1

  # Load Bash It
  source "$bashitdir/bash_it.sh"
}

activate_dircolors(){
  local dircolorfile="${1-${HOME}/.dircolors}"

  if [ ! -f ${dircolorfile} ]; then
    return 1
  fi

  eval $(dircolors -b $HOME/.dircolors)
}

activate_fzf(){
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

activate_nvm(){
    local nvm_d
    nvm_d="$HOME/.nvm"
    [ -d "${nvm_d}" ] || return 0

    export NVM_DIR="${nvm_d}"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}


activate_virtualenvwrapper(){
    local virtualenvwrapper_f
    virtualenvwrapper_f="${HOME}/.local/bin/virtualenvwrapper.sh"
    [ -f "${virtualenvwrapper_f}" ] || return 0

    export WORKON_HOME="${HOME}/.virtualenvs"
    export PROJECT_HOME="${HOME}/work"
    export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
    export VIRTUALENVWRAPPER_VIRTUALENV="${HOME}/.local/bin/virtualenv"
    source "${virtualenvwrapper_f}"
}

activate_bashit
activate_dircolors
activate_fzf
activate_nvm
activate_virtualenvwrapper

unset activate_bashit activate_dircolors activate_fzf activate_nvm activate_virtualenvwrapper

