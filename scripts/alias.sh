#!/usr/bin/env bash

alias git_clear_credential_cache='git credential-cache exit'

alias tree_ignore='tree --prune -I $(cat .gitignore | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|")'

# vim without syntax, settings and plugins 
alias vim_naked='vim -n -u NONE -i NONE -N'
alias lr='tree -I CVS'
