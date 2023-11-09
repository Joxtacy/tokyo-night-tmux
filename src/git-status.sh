#!/usr/bin/env bash
cd $1
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | egrep "^(M| M)" | wc -l)
SHOW_GIT_STATUS_OPTION="@tokyonight-show-git-status"
SHOW=$(tmux show-option -gqv "$SHOW_GIT_STATUS_OPTION")
if [ "$BRANCH" != "" ] && [ "$SHOW" != "" ]; then
  if [ "$STATUS" -eq "0" ]; then
    echo "#[fg=green,bg=#24283B,nobold,noitalics,nounderscore] #[fg=black,bg=green,bold]   $BRANCH  "
  else
    echo "#[fg=red,bg=#24283B,nobold,noitalics,nounderscore] #[fg=black,bg=red,bold]   $BRANCH  "
  fi
fi
