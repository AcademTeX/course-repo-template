#!/bin/bash

if [[ $# == 0 ]] ; then 
    echo "ERROR: Please provide arugments for encrypting your homework"
    exit 1;
fi 

while [[ $# -gt 0 ]] ; do 
    key="$1"
    case $key in 
        -up|--user-password)
            USER_PASSWORD="$2"
            shift
            shift 
            ;;
        -ap|--admin-password)
            ADMIN_PASSWORD="$2"
            shift
            shift
            ;;
        *)
            echo "UNKNOWN ARUGMENT: $key"
            exit 1
            ;;
    esac
done 

for assignment in homework* ; do 
    cd $assignment
    for file in *.tex ; do 
        latexmk -f -pdf -interaction=nonstopmode $file
    done 
    cd .. 
done

mkdir -p encrypted-homework
cp -r homework*/*.pdf encrypted-homework

cd encrypted-homework
for pdffile in *.pdf ; do 
    encfile="$(basename $pdffile .pdf)-enc.pdf"
    qpdf --encrypt $USER_PASSWORD $ADMIN_PASSWORD 256 -- $pdffile $encfile
done
cd ..

cp -r encrypted-homework/*-enc.pdf ../gh-pages/assets/files/homework
rm -rf encrypted-homework

git add -f homework*/*.pdf
git commit -m "chore(homework): Update raw homework PDFs"
git add -f ../gh-pages/assets/files/homework/*-enc.pdf
git commit -m "chore(gh-pages): Update encrypted homework PDFs"

git push 
