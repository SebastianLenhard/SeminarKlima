#
# Makefile -- themen
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	themen-handout.pdf themen-presentation.pdf

SOURCES = common.tex themen.tex

themen-presentation.pdf:	themen-presentation.tex $(SOURCES)
	pdflatex themen-presentation.tex

themen-handout.pdf:	themen-handout.tex $(SOURCES)
	pdflatex themen-handout.tex

