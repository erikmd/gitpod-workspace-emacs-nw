[![docker-push](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/docker-push.yml/badge.svg?branch=docker)](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/docker-push.yml) [![emacs-push](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/emacs-push.yml/badge.svg?branch=emacs)](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/emacs-push.yml)

# Usage

* Login in [Gitpod](https://gitpod.io/login/) using your **GitHub** account
* Open your [Gitpod **Preferences**](https://gitpod.io/user/preferences)
* Set your **Dotfiles Repository URL**: `https://github.com/erikmd/gitpod-workspace-emacs-nw`
* Open [this Gitpod URL](https://gitpod.io/new/?autostart=true&useLatest=true&editor=xterm&workspaceClass=g1-standard#https://github.com/erikmd/gitpod-workspace-emacs-nw/) (or [manually](https://gitpod.io/new) create a workspace) with the `Terminal` browser IDE
* If the loading takes too much time, try to reload the tab once (<kbd>Ctrl+R</kbd>)
* Run `tmux` or `emacs` in the workspace shell!
* Note the existence of the `(?)` special menu in Emacs, also:
  * type <kbd>Alt+F1</kbd> or <kbd>Ctrl+F1</kbd> to get some help on the main key bindings;
  * type <kbd>F7</kbd> to disable xterm-mouse-mode and thus allow copy-and-paste with the mouse.
* You may also be interested in the [Gitpod **Browser Extension**](https://www.gitpod.io/docs/configure/user-settings/browser-extension) to create workspaces more easily.

# Summary

This GitHub repository contains three branches:

* **docker**: to prebuild a Debian-based [Docker image](https://github.com/erikmd/gitpod-workspace-emacs-nw/pkgs/container/gitpod-workspace-emacs-nw) for the Gitpod workspace
* **emacs**: to prebuild an [.emacs.d](https://erikmd.github.io/gitpod-workspace-emacs-nw/batch-install/) folder from the [tapfa-init.el](https://github.com/erikmd/tapfa-init.el) setup for OCaml and Coq
* **master**: to gather the [setup.sh](./setup.sh) script and an example [.gitpod.yml](./.gitpod.yml) file
