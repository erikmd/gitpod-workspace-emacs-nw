[![docker-push](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/docker-push.yml/badge.svg?branch=docker)](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/docker-push.yml) [![emacs-push](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/emacs-push.yml/badge.svg?branch=emacs)](https://github.com/erikmd/gitpod-workspace-emacs-nw/actions/workflows/emacs-push.yml)

# Usage

> [!IMPORTANT]
> This repository essentially serves as a Gitpod [Dotfiles](https://www.gitpod.io/docs/configure/user-settings/dotfiles) repository for Emacs-in-[Browser-Terminal](https://www.gitpod.io/docs/references/ides-and-editors/browser-terminal).
> 
> It also serves as a ready-to-use demo (cf. **steps 2. and 3.** below) for OCaml and Coq experiments.
> 
> It should be unneeded to fork this repository for *reusing its content in other projects*: it suffices to follow **step 2.** below, and add a `.gitpod.yml` file in your own repository (see this [repository template](https://github.com/erikmd/gitpod-tp-env)).

1. Login in [Gitpod](https://gitpod.io/login/) using your **GitHub** account
2. Open your [Gitpod **Preferences**](https://gitpod.io/user/preferences)
   * Set your **Dotfiles Repository URL**: `https://github.com/erikmd/gitpod-workspace-emacs-nw`
3. Open [this **Gitpod URL**](https://gitpod.io/new/?autostart=true&useLatest=true&editor=xterm&workspaceClass=g1-standard#https://github.com/erikmd/gitpod-workspace-emacs-nw/) (or [manually](https://gitpod.io/new) create a workspace) with the `Terminal` browser IDE
   * If ever the loading takes too much time, try to reload the tab once (<kbd>Ctrl+R</kbd>)
4. Run `emacs` in the workspace shell (based on [`tmux`](https://github.com/tmux/tmux/wiki))
5. Note the existence of the `(?)` special menu in Emacs, also:
   * type <kbd>Alt+F1</kbd> or <kbd>Ctrl+F1</kbd> to get some help on the main key bindings;
   * type <kbd>F7</kbd> to disable xterm-mouse-mode and thus allow copy-and-paste with the mouse.
6. You may also be interested in the [Gitpod **Browser Extension**](https://www.gitpod.io/docs/configure/user-settings/browser-extension) to create workspaces more easily from other repositories.

# Summary

This self-contained GitHub repository contains three branches:

* **docker**: to prebuild a Debian-based [Docker image](https://github.com/erikmd/gitpod-workspace-emacs-nw/pkgs/container/gitpod-workspace-emacs-nw) for the Gitpod workspace
* **emacs**: to prebuild an [.emacs.d](https://erikmd.github.io/gitpod-workspace-emacs-nw/batch-install/) folder from the [tapfa-init.el](https://github.com/erikmd/tapfa-init.el) setup for OCaml and Coq
* **master**: to gather the [setup.sh](./setup.sh) script and an example [.gitpod.yml](./.gitpod.yml) file
