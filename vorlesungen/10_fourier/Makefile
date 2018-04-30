#
# Makefile -- fourier
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	fourier-handout.pdf SeminarKlima-10-fourier-presentation.pdf

SOURCES = common.tex slides.tex

SeminarKlima-10-fourier-presentation.pdf:	SeminarKlima-10-fourier-presentation.tex $(SOURCES)
	pdflatex SeminarKlima-10-fourier-presentation.tex

fourier-handout.pdf:	fourier-handout.tex $(SOURCES)
	pdflatex fourier-handout.tex

