#!/bin/sh
me=$( readlink -f -- "$0";)
branch=$1
where=$(pwd)
git submodule foreach "$me" "$branch"
git config pull.rebase true
git config remote.origin.push HEAD
git config core.autocrlf true
git config core.safecrlf false
git config submodule.recurse true
git config core.fileMode false
git config advice.skippedCherryPicks false
git remote set-branches --add origin $branch
git push --recurse-submodules=on-demand
git branch --set-upstream-to=origin/$branch $branch

