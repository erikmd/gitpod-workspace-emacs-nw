# Author: Erik Martin-Dorel, 2023-2024

ARG BASE_TAG="coqorg/coq:latest"
FROM ${BASE_TAG} as base

# Requirements for the base image:
# - OS: Debian-based
# - PKG: sudo, git
# - USER: indifferent

SHELL ["/bin/bash", "--login", "-o", "pipefail", "-c"]

# Create the gitpod user. UID must be 33333. Note the -G option.
RUN sudo useradd -l -u 33333 -G sudo,coq -md /home/gitpod -s /bin/bash -p gitpod gitpod \
  && echo '%gitpod ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/gitpod
# Equivalent: sudo usermod -aG coq gitpod

WORKDIR /home/gitpod

COPY --chown=gitpod:gitpod deps.opam ./

ARG install_deps_opam="false"

RUN if [ "${install_deps_opam}" = "true" ]; then \
  set -x \
  && nproc \
  && opam update -y \
  && opam pin add -n -y -k path deps . \
  && opam install --confirm-level=unsafe-yes -v -j "$(nproc)" --deps-only deps \
  && opam clean -a -c -s --logs \
  && chmod -R g=u /home/coq/.opam \
  && opam config list && opam list; fi

# Set the opam root path. Docker-Coq specific env var.
ENV OPAMROOT="/home/coq/.opam"

RUN sudo apt-get update -y -q \
  && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
    ca-certificates \
    curl \
    locales \
  && sudo sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen \
  && sudo locale-gen \
  && sudo update-locale LANG=en_US.UTF-8 \
  && sudo apt-get clean \
  && sudo rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
# ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

USER gitpod

# Remark: manually installed opam pkgs \notin(/workspace) are lost upon restart
#
# Remark: a squash gives smaller images but may take more time & registry space
# FROM coqorg/base:bare
# COPY --from=base --chown=gitpod:gitpod /home/coq/.opam /home/coq/.opam
# # COPY --from=base --chown=gitpod:gitpod /home/coq/.profile /home/coq/.profile
#
# Remark: at first sight, a chown is needed given the various UIDs(1000,33333).
# Besides, we cannot use DOCKERD_ARGS("remap-user") for the ambient container:
# https://www.gitpod.io/docs/configure/repositories/environment-variables#using-the-dockerd_args-environment-variable
# Actually, adding the gitpod user to the coq group should be the optimal fix.
