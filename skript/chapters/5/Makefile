#
# Makefile -- build images
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	ein.pdf ein1.pdf halb.pdf

ein.pdf:	ein.tex
	pdflatex ein.tex

ein1.pdf:	ein1.tex
	pdflatex ein1.tex

halb.pdf:	halb.tex
	pdflatex halb.tex

ein.txt:	ein.maxima
	maxima -b ein.maxima

ein.octave:	ein.m
	octave ein.m


