#
# Makefile -- build images or image sources
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
images:	planck.pdf vergleich.pdf

plot.tex:	planck.m
	octave planck.m

planck.pdf:	planck.tex plot.tex
	pdflatex planck.tex

vplot.tex:	vergleich.m
	octave vergleich.m

vergleich.pdf:	vergleich.tex vplot.tex
	pdflatex vergleich.tex

