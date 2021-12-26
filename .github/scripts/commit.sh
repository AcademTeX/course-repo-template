#!/bin/bash

CURR_DIR="$(PWD)"
REPO_DIR="$(git rev-parse --show-toplevel)"

cd $REPO_DIR
git checkout main
git config --local user.name "github-action"

git add -f homework*/*.pdf
git commit -m "chore(homework): Update homework PDF(s)"

git add -f notes/*.pdf
git commit -m "chore(notes): Update notes PDF(s)"

git push
cd $CURR_DIR
