#!/bin/bash 

cp ../common/macros.tex .

for lecture in *.md ; do 
    old_lec="old_$lecture"
    mv $lecture $old_lec
    sed "/# include macros/ r macros.tex" $old_lec >> $lecture
    rm $old_lec
done 

rm -f macros.tex
