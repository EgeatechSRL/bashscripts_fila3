#!/bin/sh
me=$( readlink -f -- "$0";)
branch=$1
where=$(pwd)
git submodule foreach "$me" "$branch"
echo "-------- START[$where ($branch)] ----------";
oco || echo '--- no changes'
echo "-------- END PUSH[$where ($branch)] ----------";
git checkout $branch --
git merge $branch
echo "-------- END BRANCH[$where ($branch)] ----------";
git pull origin $branch --autostash --allow-unrelated-histories --prune --progress -v 
echo "-------- END PULL[$where ($branch)] ----------";
git status

