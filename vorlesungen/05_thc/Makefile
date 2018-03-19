#
# Makefile -- thc
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	thc-handout.pdf SeminarKlima-05-thc-presentation.pdf

SOURCES = common.tex slides.tex bi.tex

SeminarKlima-05-thc-presentation.pdf:	SeminarKlima-05-thc-presentation.tex $(SOURCES)
	pdflatex SeminarKlima-05-thc-presentation.tex

thc-handout.pdf:	thc-handout.tex $(SOURCES)
	pdflatex thc-handout.tex

