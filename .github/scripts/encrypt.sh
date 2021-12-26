#!/bin/bash

CURR_DIR="$(PWD)"
REPO_DIR="$(git rev-parse --show-toplevel)"

while [[ $# -gt 0 ]] ; do 
    key="$1"
    case $key in 
        -p|--password)
            HOMEWORK_PASSWORD="$2"
            shift
            shift
            ;;
        *)
            echo "UNKNOWN ARUGMENT: $key"
            exit 1
            ;;
    esac
done 

# if [[ ! -z "$HOMEWORK_PASSWORD" ]] ; then 
#     echo "No password provided, so skipping encryption for homework"
#     exit 0
# fi
if [[ ! -z "$HOMEWORK_PASSWORD" ]] ; then 
    echo "ERROR: Must provide a homework encryption password"
    exit 1
fi 

cd $REPO_DIR
if [[ ! -d encrypted ]] ; then 
    mkdir -p encrypted
fi 

cp -r homework*/*.pdf encrypted

cd encrypted
for pdffile in *.pdf ; do 
    encfile="$(basename $pdffile .pdf)-enc.pdf"
    qpdf --encrypt $HOMEWORK_PASSWORD $HOMEWORK_PASSWORD 256 -- $pdffile $encfile
done 
cd $CURR_DIR
