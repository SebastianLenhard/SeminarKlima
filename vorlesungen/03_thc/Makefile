#
# Makefile -- thc
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	thc-handout.pdf SeminarKlima-03-thc-presentation.pdf

SOURCES = common.tex slides.tex

SeminarKlima-03-thc-presentation.pdf:	SeminarKlima-03-thc-presentation.tex $(SOURCES)
	pdflatex SeminarKlima-03-thc-presentation.tex

thc-handout.pdf:	thc-handout.tex $(SOURCES)
	pdflatex thc-handout.tex

