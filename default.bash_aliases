# -*- mode: shell-script; -*- Author: Erik Martin-Dorel, 2023-2024

# https://askubuntu.com/a/616066
if [ "$TERM" = "xterm" ]; then
    export TERM=xterm-256color
fi
if [ "$TERM" = "screen" -o "$TERM" = "screen-256color" ]; then
    export TERM=screen-256color
    unset TERMCAP
fi

if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
  # export GIT_PS1_SHOWUNTRACKEDFILES="true"
  export GIT_PS1_SHOWDIRTYSTATE="true"
  export GIT_PS1_SHOWUPSTREAM="verbose git" # name
  export GIT_PS1_DESCRIBE_STYLE="branch"
  # PS1="${PS1/\\\$/\$(__git_ps1 \" (%s)\")\\\$}"
  # https://github.com/gitpod-io/workspace-images/blob/961ca52f04e64101a5b362aba106b4ee87b2bd3d/base/Dockerfile#L57C1-L57C128
  # Replace (\$ -> $, \" -> "), Remove last-but-one space
  PS1='\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")$ '
fi

## Propagate OPAMROOT to PATH etc.
eval $(opam env)

tapfa_init_await() {
  if [ -f ~/.tapfa-init."$1".done ]; then
    "$@"
  else
    echo "Please wait for $1... or press C-c"; gp sync-await "$1" && "$@"
  fi
}
alias tmux='tapfa_init_await tmux'
alias emacs='tapfa_init_await emacs'
echo '~/.bash_aliases loaded'

git config --global push.default upstream
git config --global pull.rebase false  # = merge by default, can still do "git pull -r"
git config --global color.ui auto
git config --global rebase.stat true
git config --global merge.log true
git config --global merge.conflictstyle diff3
git config --global core.editor emacs
export GIT_PAGER=cat
