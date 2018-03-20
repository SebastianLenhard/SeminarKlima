#
# Makefile -- build additional materials
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	images

.PHONY:	images

images:
	for d in 1 2 3 3d 4 tikz mp;					\
	do								\
		if [ -d $${d} -a -f $${d}/Makefile ];			\
		then							\
			(cd $${d}; make images);			\
		fi;							\
	done

