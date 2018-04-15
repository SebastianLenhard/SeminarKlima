#
# Makefile -- red
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	red-handout.pdf SeminarKlima-07-red-presentation.pdf

SOURCES = common.tex slides.tex

SeminarKlima-07-red-presentation.pdf:	SeminarKlima-07-red-presentation.tex $(SOURCES)
	pdflatex SeminarKlima-07-red-presentation.tex

red-handout.pdf:	red-handout.tex $(SOURCES)
	pdflatex red-handout.tex

