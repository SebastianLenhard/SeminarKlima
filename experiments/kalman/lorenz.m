#
# lorenz.m -- lorenz model integration
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
global sigma
global Beta
global rho
sigma = 10;
Beta = 8/3;
rho = 28;

function derivative = lorenz(x, t)
	global Beta
	global sigma
	global rho
	derivative = zeros(3,1);
	xdot = - sigma * x(1,1) + sigma * x(2,1);
	ydot = rho * x(1) - x(2) - x(1) * x(3);
	zdot = -Beta * x(3) + x(1) * x(2);
	derivative(1,1) = xdot;
	derivative(2,1) = ydot;
	derivative(3,1) = zdot;
endfunction

x0 = zeros(3,1)
x0(1,1) = 3;
x0(2,1) = 15;
x0(3,1) = 1;

t = (0:100) / 10;

x = lsode(@lorenz, x0, t);

function jac = jacobian(x, t)
	global Beta
	global sigma
	global rho
	jac = [
		-sigma,	  sigma,     0;
		rho-x(3),    -1, -x(1);
		x(2),      x(1), -Beta;
	]
endfunction

[X, istate, msg] = lsode({@lorenz, @jacobian}, x0, t);
X
istate
msg




