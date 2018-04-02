function d_dt = recharge_dgl_2(t,y)
%definiert die DGL
%Koeffizienten
r = 1/4;
a = 1/8;
g = 3/4;
b = 5/3;

d_dt = zeros(2,1);
d_dt(1) = (g*b - 1)*y(1) + g*y(2);
d_dt(2) = -a*b*y(1) - r*y(2);
end
