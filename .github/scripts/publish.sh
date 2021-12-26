#!/bin/bash 

CURR_DIR="$(PWD)"
REPO_DIR="$(git rev-parse --show-toplevel)"

cd $REPO_DIR
if [[ -d encrypted ]] ; then 
    cp -r encrypted/*.pdf gh-pages/assets/files/homework
    rm -rf encrypted
# Uncomment the below if you want to publish unencrypted homeworks
# else 
#     cp -r homework*/*.pdf gh-pages/assets/files/homework
fi 

cp -r lectures/*.pdf gh-pages/assets/files/raw-notes
cp -r notes/*.pdf gh-pages/assets/files/tex-notes

git add -f gh-pages/assets/files/**/*.pdf
git commit -m "chore(gh-pages): Updating published PDFs"

git push
cd $CURR_DIR
