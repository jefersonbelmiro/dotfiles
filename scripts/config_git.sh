#!/usr/bin/env bash

git config --global user.email "jeferson.belmiro@gmail.com"
git config --global user.name "Jeferson Belmiro"
git config --global push.default "simple"
git config --global mergetool.vimdiff3.cmd 'cp "$LOCAL" "$MERGED" && vim -f -d "$MERGED" "$REMOTE"'
git config --global mergetool.keepBackup false
git config --global merge.tool "vimdiff3"
git config --global mergetool.prompt false
git config --global core.pager 'less -r'
git config --global alias.lg "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

