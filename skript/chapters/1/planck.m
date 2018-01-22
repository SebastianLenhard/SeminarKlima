#
# planck.m -- compute planck radiation law distribution
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
global h = 6.62607004e-34;
global k = 1.38064852e-23;
global c = 299792458;
T = 5778

function retval = planck(lambda, T)
	global h
	global k
	global c
	n = 2 * pi * h * c^2 / lambda^5;
	retval = n / (exp(h * c / (lambda * k * T)) - 1);
end

steps = 1000
lambdaa = 0.000000100; # 100nm
lambdab = 0.000010000; # 1mu m
f = exp(log(lambdab/lambdaa) / steps)

m = 100 * 1e-15;

#
# Temperatur der Sonne
#
x = lambdaa;
y = m * planck(x, T)

fid = fopen("plot.tex", "w")

fprintf(fid, "\\draw[color=red] (%.3f, %.3f)\n", x, y);
for i = 1:steps
	x = x * f;
	y = m * planck(x, T);
	fprintf(fid, "--(%.3f, %.3f)\n", log10(x) + 7, y);
endfor

fprintf(fid, ";\n")

fclose(fid);

