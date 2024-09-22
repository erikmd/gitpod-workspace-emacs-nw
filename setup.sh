#!/usr/bin/env bash
# Author: Erik Martin-Dorel, 2023-2024

## Setup Git prompt
version=$(git --version | cut -d ' ' -f 3)
curl -fL -o ~/.git-prompt.sh https://github.com/git/git/raw/v$version/contrib/completion/git-prompt.sh
chmod a-w ~/.git-prompt.sh

## DONT overwrite ~/.bashrc
cp -fv default.bash_aliases ~/.bash_aliases || cp -fv ~/.dotfiles/default.bash_aliases ~/.bash_aliases
# . ~/.bash_aliases ## DONT do this here

tapfa_init_done() {
  touch ~/.tapfa-init."$1".done
  gp sync-done "$1"
  # cf. tapfa_init_await in default.bash_aliases
}

## Install emacs and utils, including tmux
sudo apt-get update -y -q
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
emacs-nox htop markdown shellcheck tig tmux tree

## Setup uid:gid compatibility
sudo usermod -aG coq gitpod
# sudo apt-get clean; sudo rm -rf /var/lib/apt/lists/*
cat > ~/.tmux.conf <<EOF
# set-option -g default-command bash # https://unix.stackexchange.com/a/691911/297058
set-option -g default-command "newgrp coq || exec bash -i"
EOF
tapfa_init_done tmux

## Setup curated emacs config
# = cached version of https://github.com/erikmd/tapfa-init.el
time curl -fsSL https://erikmd.github.io/gitpod-workspace-emacs-nw/batch-install/.emacs > ~/.emacs
time curl -fsSL https://erikmd.github.io/gitpod-workspace-emacs-nw/batch-install/.emacs.d.tar.gz > ~/.emacs.d.tar.gz
( cd ; tar xzf .emacs.d.tar.gz )
tapfa_init_done emacs

echo 'tmux new-session -A -s gitpod "echo \"Welcome to Gitpod Terminal! You can now run: emacs\"; newgrp coq || exec bash -i"' >> ~/.bash_profile

# Documentation:
# https://www.gitpod.io/docs/configure/workspaces/tasks#task-types-and-execution-order
# https://www.gitpod.io/docs/configure/workspaces/tasks#prebuilds
# https://www.gitpod.io/docs/configure/workspaces/tasks#restart-a-workspace
# https://www.gitpod.io/docs/configure/user-settings/dotfiles#example
# &
# https://www.gitpod.io/docs/configure/user-settings/dotfiles#how-to-install-symlinks-from-dotfiles-when-using-a-custom-installation-script
# cat /home/gitpod/.dotfiles.log
