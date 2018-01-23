#
# aequatorial.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
global h = 0.25
h = 0.2
h = 0.255
h = 0.247

function retval = f(x, t)
	global h
	retval = zeros(4,1);
	y = x(2,1);
	retval(1,1) = x(3,1);
	retval(2,1) = x(4,1);
	retval(3,1) = h * y * x(4,1);
	retval(4,1) = -h * y * x(3,1);
endfunction

x0 = [
	0, 4, 0, -1
];

t = 0:0.1:20;

p = lsode('f', x0, t);

global fid;

function stream(alpha,limit)
	global fid
	x0 = [ 0, 4, cos(alpha), sin(alpha) ];
	t = 0:0.1:limit;
	x = lsode('f', x0, t);
	fprintf(fid, "\\draw[color=gray] (%f,%f)\n", x(1,1), x(1,2))
	for i = 2:(size(t)(1,2))
		fprintf(fid, "--(%f,%f)\n", x(i,1), x(i,2));
	end
	fprintf(fid, ";\n")
endfunction

function curves(filename, hvalue)
	global h
	global fid
	h = hvalue;
	fid = fopen(filename, "w");
	step = pi/16;
	for alpha = 0:step:(2*pi-step/2)
		stream(alpha, 40);
	end
	fclose(fid);
endfunction

curves("streamsupper.tex", 0.26)
curves("streamscross.tex", 0.22)
	
