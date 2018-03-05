#
# Makefile -- intro
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	intro-handout.pdf intro-presentation.pdf

SOURCES = common.tex intro.tex

intro-presentation.pdf:	intro-presentation.tex $(SOURCES)
	pdflatex intro-presentation.tex

intro-handout.pdf:	intro-handout.tex $(SOURCES)
	pdflatex intro-handout.tex

