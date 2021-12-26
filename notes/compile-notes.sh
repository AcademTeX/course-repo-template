#!/bin/bash

for file in *.tex ; do 
    latexmk -f -pdf -interaction=nonstopmode $file
done

cp -r *.pdf ../gh-pages/assets/files/tex-notes

git add -f *.pdf 
git commit -m "chore(notes): Update raw notes PDF"
git add -f ../gh-pages/assets/files/tex-notes
git commit -m "chore(gh-pages): Update published notes PDF"

git push 
