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

function Derivative = Lorenz(X, t)
	Derivative = zeros(12,1);
	x = X(1:3,1);
	Derivative(1:3,1) = lorenz(x, t);
	J = [
		 X(4),  X(5),  X(6);
		 X(7),  X(8),  X(9);
		X(10), X(11), X(12);
	];
	F = jacobian(x, t) * J;
	F
	Derivative( 4,1) = F(1,1);
	Derivative( 5,1) = F(1,2);
	Derivative( 6,1) = F(1,3);
	Derivative( 7,1) = F(2,1);
	Derivative( 8,1) = F(2,2);
	Derivative( 9,1) = F(2,3);
	Derivative(10,1) = F(3,1);
	Derivative(11,1) = F(3,2);
	Derivative(12,1) = F(3,3);
endfunction

D0 = zeros(12, 1);
D0(1:3,1) = x0;
D0( 4,1) = 1;
D0( 5,1) = 0;
D0( 6,1) = 0;
D0( 7,1) = 0;
D0( 8,1) = 1;
D0( 9,1) = 0;
D0(10,1) = 0;
D0(11,1) = 0;
D0(12,1) = 1;
D0

[X, istate, msg] = lsode(@Lorenz, D0, t)

X
istate
msg




