#
# Makefile -- Abbildungen erzeugen
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
BILDER = lorenz-definition.pdf lorenz-stabil.pdf drehmoment.pdf \
	green-curves.pdf green-curve.pdf rotation.pdf konvektion.pdf \
		upright.pdf downright.pdf

all:	$(BILDER)

images:	$(BILDER)

lorenz-definition.pdf:	lorenz-definition.tex
	pdflatex lorenz-definition.tex

lorenz-stabil.pdf:	lorenz-stabil.tex
	pdflatex lorenz-stabil.tex

drehmoment.pdf:	drehmoment.tex
	pdflatex drehmoment.tex

green-curves.pdf:	green-curves.tex
	pdflatex green-curves.tex

green-curve.pdf:	green-curve.tex
	pdflatex green-curve.tex

rotation.pdf:	rotation.tex
	pdflatex rotation.tex

konvektion.pdf:	konvektion.tex
	pdflatex konvektion.tex


up.tex down.tex:	corstat.m
	octave corstat.m

downright.pdf:	downright.tex down.tex
	pdflatex downright.tex

upright.pdf:	upright.tex up.tex
	pdflatex upright.tex
