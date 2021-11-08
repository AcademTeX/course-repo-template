#!/bin/bash

filepath=$(fzf -q ^hwk -q .tex$)
curdir=$(pwd)
texdir=$(dirname $filepath)
texfile=$(basename $filepath)

cd $texdir
pdflatex -interaction=nonstopmode $texfile
cd $curdir
