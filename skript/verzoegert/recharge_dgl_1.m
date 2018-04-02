function d_dt = recharge_dgl_1(t,y)
%definiert die DGL
%Koeffizienten
c = 5;
g = 0.77;
e = 0.01;
r = 1.312;
a = 0.6;
b = 14;
% dTe/dt = -c*Te + g*(hw + b*Te) - e*(hw + b*Te)^3
% dhw/dt = -r*hw - a*b*Te
d_dt = zeros(2,1);
d_dt(1) = -c*y(1) + g*(y(2) + b*y(1)) - e*(y(2) + b*y(1))^3;
d_dt(2) = -r*y(2) - a*b*y(1);
end
