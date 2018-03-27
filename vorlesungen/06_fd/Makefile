#
# Makefile -- fd
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	fd-handout.pdf SeminarKlima-06-fd-presentation.pdf

SOURCES = common.tex slides.tex

SeminarKlima-06-fd-presentation.pdf:	SeminarKlima-06-fd-presentation.tex $(SOURCES)
	pdflatex SeminarKlima-06-fd-presentation.tex

fd-handout.pdf:	fd-handout.tex $(SOURCES)
	pdflatex fd-handout.tex

