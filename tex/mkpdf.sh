#!/bin/sh

FILENAME="$1"

# create dvi file
latex $FILENAME

# find bib file
# setenv BIBINPUTS :~fessler/l/tex/biblio/bib
setenv BIBINPUTS ../bib/
bibtex $FILENAME

# compile twice more to get references right
latex $FILENAME
latex $FILENAME

# print postscript
dvips $FILENAME

# print pdf
ps2pdf -dPDFSETTINGS=/prepress -dEncodeGrayImages=false $FILENAME.ps

# open pdf
pkill $FILENAME.pdf
sleep 0.2s
open $FILENAME.pdf


