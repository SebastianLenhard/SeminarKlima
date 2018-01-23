#
# Makefile -- build images or image sources
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
images:	planck.pdf vergleich.pdf einfall.pdf betaplane.jpg stream.pdf cross.pdf

plot.tex:	planck.m
	octave planck.m

planck.pdf:	planck.tex plot.tex
	pdflatex planck.tex

vplot.tex:	vergleich.m
	octave vergleich.m

vergleich.pdf:	vergleich.tex vplot.tex
	pdflatex vergleich.tex

einfall.pdf:	einfall.tex
	pdflatex einfall.tex

stream.pdf:	stream.tex streamsupper.tex
	pdflatex stream.tex

cross.pdf:	cross.tex streamscross.tex
	pdflatex cross.tex

streamsupper.tex streamscross:	aequatorial.m
	octave aequatorial.m

betaplane.jpg:	betaplane.png	
	convert betaplane.png -density 300 -units PixelsPerInch betaplane.jpg

betaplane.png:	betaplane.pov
	sh ../../../povray +A0.1 -W1920 -H1080 -Obetaplane.png betaplane.pov

