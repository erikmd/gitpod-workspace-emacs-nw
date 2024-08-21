[![docker-push](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/docker-push.yml/badge.svg?branch=docker)](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/docker-push.yml) [![emacs-push](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/emacs-push.yml/badge.svg?branch=emacs)](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/emacs-push.yml)

# Usage

* Open [the Gitpod URL associated with this repo](https://gitpod.io/#https://github.com/erikmd/gitpod-workspace-emacs-nw/)
* Select `Terminal` as editor
* Click on `Continue`

# Summary

This GitHub repository contains three branches:

* **docker**: to prebuild a Debian-based [Docker image](https://github.com/erikmd/gitpod-workspace-emacs-nw/pkgs/container/gitpod-workspace-emacs-nw) for the Gitpod workspace
* **emacs**: to prebuild an [.emacs.d](https://erikmd.github.io/gitpod-workspace-emacs-nw/batch-install/) folder from the [tapfa-init.el](https://github.com/erikmd/tapfa-init.el) setup for OCaml and Coq
* **master**: to gather the main [.gitpod.yml](./.gitpod.yml) configuration using these prebuilt artifacts
