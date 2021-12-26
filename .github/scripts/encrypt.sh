#!/bin/bash

CURR_DIR="$(PWD)"
REPO_DIR="$(git rev-parse --show-toplevel)"

cd $REPO_DIR
if [[ ! -d encrypted ]] ; then 
    mkdir -p encrypted
fi 

cp -r homework*/*.pdf encrypted

cd encrypted
for pdffile in *.pdf ; do 
    encfile="$(basename $pdffile .pdf)-enc.pdf"
    qpdf --encrypt $HOMEWORK_PASSWORD $HOMEWORK_PASSWORD 256 -- $pdffile $encfile
    rm -rf $pdffile
done 
cd $CURR_DIR
