#!/bin/bash
apt-get -q update \
    && DEBIAN_FRONTEND=noninteractive apt-get \
       --no-install-recommends -yq install \
       iproute2 \
       iputils-ping \
       levee \
       openssh-client \
       python3-apt \
       python3-distro \
       python3-dnspython \
       python3-future \
       python3-ldap \
       python3-pip \
       python3-wheel \
       python3-setuptools \
       python3-cryptography \
       procps \
       sudo \
       tree \
    && pip3 install \
       debops[ansible] \
    && echo "Cleaning up cache directories..." \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb /root/.cache/*

groupadd --system admins \
    && echo "%admins ALL = (ALL:ALL) NOPASSWD: SETENV: ALL" > /etc/sudoers.d/admins \
    && chmod 0440 /etc/sudoers.d/admins \
    && useradd --user-group --create-home --shell /bin/bash \
       --home-dir /home/ansible --groups admins ansible
