#
# Makefile -- build additional materials
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	images

images:
	-test -d 3d && ( cd 3d; make images )
	-test -d tikz && ( cd tikz; make images )
	-test -d mp && ( cd mp; make images )

