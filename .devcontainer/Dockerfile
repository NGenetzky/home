# https://mcr.microsoft.com/en-us/artifact/mar/devcontainers/base
ARG VARIANT="bookworm"
FROM mcr.microsoft.com/devcontainers/base:${VARIANT}

LABEL org.opencontainers.image.source="https://github.com/ngenetzky/home"
LABEL org.opencontainers.image.title="home"
LABEL org.opencontainers.image.description="Nathan Genetzky's dotfiles devcontainer"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        tmux \
        vim-nox \
        yadm \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./.devcontainer/ /.devcontainer/

ARG USERNAME=vscode
ARG YADM_SRCDIR='/usr/local/share/yadm_repo_0.git'
ARG YADM_SRCURI='https://github.com/ngenetzky/home.git'
ARG YADM_SRCREV='master'

RUN USERNAME="${USERNAME}" \
    YADM_SRCDIR="${YADM_SRCDIR}" \
    YADM_SRCURI="${YADM_SRCURI}" \
    YADM_SRCREV="${YADM_SRCREV}" \
    /.devcontainer/ngenetzky_devcontainer_debian.bash
