#!/bin/sh
# Feeling a bit lazy right now...
# shellcheck disable=SC2086
# shellcheck disable=SC2012

apt_get_update_maybe() {
    # shellcheck disable=SC2012
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        apt-get update
    fi
}

apt_get_install_0() {
    # From vscode common-debian
    PACKAGE_LIST="apt-utils \
        git \
        openssh-client \
        gnupg2 \
        iproute2 \
        procps \
        lsof \
        htop \
        net-tools \
        psmisc \
        curl \
        wget \
        rsync \
        ca-certificates \
        unzip \
        zip \
        nano \
        vim-tiny \
        less \
        jq \
        lsb-release \
        apt-transport-https \
        dialog \
        libc6 \
        libgcc1 \
        libkrb5-3 \
        libgssapi-krb5-2 \
        libicu[0-9][0-9] \
        liblttng-ust0 \
        libstdc++6 \
        zlib1g \
        locales \
        sudo \
        ncdu \
        man-db \
        strace"

    apt-get -y install \
        --no-install-recommends ${PACKAGE_LIST}
}

apt_get_install_1(){
    # From vscode common-debian
    PACKAGE_LIST="yadm \
        vim \
        tmux \
        "

    apt-get -y install \
        --no-install-recommends ${PACKAGE_LIST}
}

useradd_user(){
    if [ -z "${USERNAME}" ]; then
        return 0
    fi
    USER_UID=${USER_UID:-"automatic"}
    USER_GID=${USER_GID:-"automatic"}

    # Create or update a non-root user to match UID/GID.
    if id -u ${USERNAME} > /dev/null 2>&1; then
        # User exists, update if needed
        if [ "${USER_GID}" != "automatic" ] && [ "$USER_GID" != "$(id -G $USERNAME)" ]; then
            groupmod --gid $USER_GID $USERNAME
            usermod --gid $USER_GID $USERNAME
        fi
        if [ "${USER_UID}" != "automatic" ] && [ "$USER_UID" != "$(id -u $USERNAME)" ]; then
            usermod --uid $USER_UID $USERNAME
        fi
    else
        # Create user
        if [ "${USER_GID}" = "automatic" ]; then
            groupadd $USERNAME
        else
            groupadd --gid $USER_GID $USERNAME
        fi
        if [ "${USER_UID}" = "automatic" ]; then
            useradd -s /bin/bash --gid $USERNAME -m $USERNAME
        else
            useradd -s /bin/bash --uid $USER_UID --gid $USERNAME -m $USERNAME
        fi
    fi

}

################################################################################

_bootstrap_mkdir(){
    mkdir -p \
        "${HOME}/.local/bin/" \
        "${HOME}/.local/home/" \
        "${HOME}/.local/share/" \
        "${HOME}/.local/src/" \
        "${HOME}/.local/var/" \
        "${HOME}/bin/"
}

_bootstrap_tpm(){
    S_TPM="${HOME}/.tmux/plugins/tpm"
    [ -d "${S_TPM}" ] && return 0
    git clone --depth=1 'https://github.com/tmux-plugins/tpm.git' "${S_TPM}"
    "${S_TPM}/bin/install_plugins"
}

_bootstrap_vim(){
    if ! command -v 'vim' >/dev/null 2>&1; then
        return 0
    fi
    if [ ! -f "${HOME}/.vim/autoload/plug.vim" ] ; then
        curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs \
          'https://raw.githubusercontent.com/junegunn/vim-plug/359ce90b9b37442974fd3ccd9279493d85efb3af/plug.vim'
    fi
    vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
}

_bootstrap_yadm(){
    if [ -d "$HOME/.local/share/yadm/repo.git" ] ; then
        return 0
    fi
    if [ -d "$HOME/.yadm/repo.git" ] ; then
        return 0
    fi

    yadm clone 'https://home.genetzky.us'
    yadm remote set-url origin --push none
}

################################################################################

_bootstrap_user(){
    _bootstrap_yadm
    _bootstrap_mkdir
    _bootstrap_tpm
    _bootstrap_vim
}

_bootstrap_root(){
    apt_get_update_maybe
    apt_get_install_0
    apt_get_install_1
    useradd_user
    _bootstrap_yadm

    # TODO
    #update-alternatives --set editor "$(which nvim)"
    # TODO
    #locale.gen
}

_bootstrap(){
    if [ "$(id -u)" -ne 0 ]; then
        _bootstrap_user
    else
        _bootstrap_root
    fi
}

################################################################################

set -eu
_bootstrap
