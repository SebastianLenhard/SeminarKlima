#
# Makefile -- eiszeit
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	eiszeit-handout.pdf SeminarKlima-11-eiszeit-presentation.pdf

SOURCES = common.tex slides.tex

PDF =	plot01.pdf plot02.pdf plot03.pdf plot04.pdf plot05.pdf \
	plot06.pdf plot07.pdf plot08.pdf plot09.pdf plot10.pdf \
	mean01.pdf mean02.pdf mean03.pdf mean04.pdf mean05.pdf \
	mean06.pdf mean07.pdf mean08.pdf mean09.pdf mean10.pdf

SeminarKlima-11-eiszeit-presentation.pdf:	SeminarKlima-11-eiszeit-presentation.tex $(SOURCES)
	pdflatex SeminarKlima-11-eiszeit-presentation.tex

eiszeit-handout.pdf:	eiszeit-handout.tex $(SOURCES) $(PDF)
	pdflatex eiszeit-handout.tex

