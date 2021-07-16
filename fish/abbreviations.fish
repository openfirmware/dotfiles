#!/usr/bin/env fish

abbr ga 'git add'
abbr gc 'git commit'
abbr gca 'git commit --all'
abbr glog "git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
abbr gp 'git push'
abbr gs 'git status -sb'
abbr grm "git status | grep deleted | awk '{print \$3}' | xargs git rm"

echo "fish abbreviations set."