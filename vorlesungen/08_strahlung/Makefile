#
# Makefile -- strahlung
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	strahlung-handout.pdf SeminarKlima-08-strahlung-presentation.pdf

SOURCES = common.tex slides.tex
IMAGES = spektrum.png

SeminarKlima-08-strahlung-presentation.pdf:	SeminarKlima-08-strahlung-presentation.tex $(SOURCES) $(IMAGES)
	pdflatex SeminarKlima-08-strahlung-presentation.tex

strahlung-handout.pdf:	strahlung-handout.tex $(SOURCES) $(IMAGES)
	pdflatex strahlung-handout.tex

