# [Choice] Debian version: buster, stretch
ARG VARIANT="buster"

# [Choice] Debian version: standard, security, vnc
ARG DEBASE_VARIANT="standard"

# You can pick any Debian/Ubuntu-based image.
# ARG FROM_IMAGE="buildpack-deps:${VARIANT}-curl"
# ARG FROM_IMAGE="jgoerzen/debian-base-standard:${VARIANT}"
ARG FROM_IMAGE="jgoerzen/debian-base-${DEBASE_VARIANT}:${VARIANT}"

FROM ${FROM_IMAGE}


COPY ./.devcontainer/ /.devcontainer/

ARG USERNAME=user

ARG YADM_SRCURI='https://home.genetzky.us'
ARG YADM_SRCDIR='/usr/local/share/us.genetzky.home.git'
# ARG YADM_SRCREV='wip/bootstrap'
ARG YADM_SRCREV='wip/yadm-v1'

RUN USERNAME="${USERNAME}" YADM_SRCREV="${YADM_SRCREV}"  /.devcontainer/ngenetzky_devcontainer_debian.bash

ENTRYPOINT ["/usr/local/bin/boot-debian-base"]
CMD [ "sleep", "infinity" ]
