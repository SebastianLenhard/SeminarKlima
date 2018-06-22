#
# ell2.m -- Auswertung des elliptischen Integrals
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#

global gamma = -23.4 * pi / 180;
global theta;

function retval = f(phi)
	global gamma
	global theta
	y = sin(gamma) * sin(theta) * cos(phi) + cos(gamma) * cos(theta);
	retval = sqrt(1 - y^2) / (2 * pi^2);
endfunction

fid = fopen("elltheta.tex", "w");

fprintf(fid, "\\draw[color=red,line width=1.4pt]\n");

theta = 0;
thetastep = pi / 100;
scale = 4;
first = 1;
while (theta < pi + thetastep/2)
	i = 4 * quad(@f, 0, 2*pi);
	if (first == 1)
		fprintf(fid, "(%f,%f)\n", theta, i);
		first = 0;
	else
		fprintf(fid, "--(%f,%f)\n", theta, i);
	end
	theta = theta + thetastep
end
fprintf(fid, ";\n");
fclose(fid);


