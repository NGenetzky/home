#!/bin/sh
# Feeling a bit lazy right now...
# shellcheck disable=SC2086
# shellcheck disable=SC2012

apt_get_update_maybe() {
    # shellcheck disable=SC2012
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        apt-get -q update
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

    apt-get -yq install --no-install-recommends \
        ${PACKAGE_LIST}
}

apt_get_install_1(){
    PACKAGE_LIST="\
        git \
        tmux \
        vim-nox \
        yadm \
        "

    apt-get -yq install --no-install-recommends \
        ${PACKAGE_LIST}
}

apt_get_clean(){
    apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
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

yadm_clone_src(){
    if [ -d "/usr/local/share/github.com.genetzky.home.git" ] ; then
        return 0
    fi

    git clone --bare \
        'https://home.genetzky.us' \
        '/usr/local/share/us.genetzky.home.git'
}

ngenetzky_devcontainer_debian(){
    apt_get_update_maybe
    # apt_get_install_0
    apt_get_install_1

    yadm_clone_src

    # TODO
    #update-alternatives --set editor "$(which nvim)"
    # TODO
    #locale.gen

    if [ -z "${USERNAME}" ]; then
        yadm clone '/usr/local/share/us.genetzky.home.git'
    else
        useradd_user
        # sudo -u "${USERNAME}"
        su "${USERNAME}" \
            -- \
            yadm clone '/usr/local/share/us.genetzky.home.git'
    fi

    apt_get_clean
}

set -eu
set -x
ngenetzky_devcontainer_debian
