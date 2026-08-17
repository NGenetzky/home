#!/bin/sh

set -eu
set -x

YADM_SRCURI="${YADM_SRCURI:-https://github.com/ngenetzky/home.git}"
YADM_SRCDIR="${YADM_SRCDIR:-/usr/local/share/yadm_repo_0.git}"
YADM_SRCREV="${YADM_SRCREV:-master}"

yadm_clone_src() {
    [ -d "${YADM_SRCDIR}" ] && return 0
    git clone --bare "${YADM_SRCURI}" "${YADM_SRCDIR}"
    git -C "${YADM_SRCDIR}" symbolic-ref HEAD "refs/heads/${YADM_SRCREV}"
    git -C "${YADM_SRCDIR}" branch -f master "${YADM_SRCREV}"
}

yadm_clone_src
git config --system --add safe.directory "${YADM_SRCDIR}"

if [ -n "${USERNAME:-}" ]; then
    su "${USERNAME}" -- yadm clone "${YADM_SRCDIR}"
    su "${USERNAME}" -- yadm bootstrap || true
else
    yadm clone "${YADM_SRCDIR}"
    yadm bootstrap || true
fi
