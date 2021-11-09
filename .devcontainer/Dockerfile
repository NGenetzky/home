# [Choice] Debian version: bullseye, buster, stretch
ARG VARIANT="bullseye"

# [Choice] Debian version: standard, security, vnc
ARG DEBASE_VARIANT="standard"

# You can pick any Debian/Ubuntu-based image.
# ARG FROM_IMAGE="buildpack-deps:${VARIANT}-curl"
# ARG FROM_IMAGE="jgoerzen/debian-base-standard:${VARIANT}"
ARG FROM_IMAGE="jgoerzen/debian-base-${DEBASE_VARIANT}:${VARIANT}"

FROM ${FROM_IMAGE}

RUN apt-get --quiet --yes update \
    # We first install these packages
    # 'apt-utils dialog' to avoid skipping package configuration
    && apt-get -y install --no-install-recommends \
        apt-utils \
        dialog \
    # 'git' so that we can configure etckeeper
    # 'sudo' so that we can add users to it below.
    && apt-get -y install --no-install-recommends \
        git \
        sudo \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./.devcontainer/ /.devcontainer/

ARG USERNAME=user
ARG YADM_SRCDIR='/usr/local/share/yadm_repo_0.git'

ARG YADM_SRCURI='https://home.genetzky.us'
# ARG YADM_SRCREV='wip/bootstrap'
# ARG YADM_SRCREV='wip/yadm-v1'
# ARG YADM_SRCREV='wip/yadm-v2'
ARG YADM_SRCREV='wip/devcontainer'

# ARG YADM_SRCURI='/usr/local/share/yadm_src.git'
# COPY ./.git/ "${YADM_SRCURI}"

RUN USERNAME="${USERNAME}" YADM_SRCREV="${YADM_SRCREV}"  /.devcontainer/ngenetzky_devcontainer_debian.bash

ENTRYPOINT ["/usr/local/bin/boot-debian-base"]
CMD [ "sleep", "infinity" ]
