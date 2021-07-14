# [Choice] Debian version: buster, stretch
ARG VARIANT="buster"

# [Choice] Debian version: standard, security, vnc
ARG DEBASE_VARIANT="standard"

# You can pick any Debian/Ubuntu-based image.
# ARG FROM_IMAGE="buildpack-deps:${VARIANT}-curl"
# ARG FROM_IMAGE="jgoerzen/debian-base-standard:${VARIANT}"
ARG FROM_IMAGE="jgoerzen/debian-base-${DEBASE_VARIANT}:${VARIANT}"

FROM ${FROM_IMAGE}

ARG USERNAME=user
COPY ./.config/yadm/bootstrap /usr/local/bin/ngenetzky_yadm_bootstrap
RUN USERNAME="${USERNAME}" /usr/local/bin/ngenetzky_yadm_bootstrap

ENTRYPOINT ["/usr/local/bin/boot-debian-base"]
CMD [ "sleep", "infinity" ]
