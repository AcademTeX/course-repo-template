#!/bin/bash

pdflatex -interaction=nonstopmode notes.tex
biber notes
pdflatex -interaction=nonstopmode notes.tex
