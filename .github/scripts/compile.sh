#!/bin/bash

# Compile homework assignments
for assignment in homework* ; do 
    cd $assignment
    for file in *.tex ; do 
        latexmk -f -pdf -interaction=nonstopmode $file
    done 
    cd .. 
done

# Compile notes
cd notes
for file in *.tex ; do 
    latexmk -f -pdf -interaction=nonstopmode $file
done
cd ..
